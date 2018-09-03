//
//  RoomViewModel.swift
//  werewolf-assistant
//
//  Created by Lan Xiao on 03/09/2018.
//  Copyright © 2018 Lan Xiao. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import SwiftGRPC
import MaterialComponents
import SwiftySound

@objc protocol RoomViewModeling {
    func drive(controller: RoomViewController)
    func dispose()

    @objc func onRoleImageViewPressed(_ sender: UITapGestureRecognizer)
}

final class RoomViewModel: RoomViewModeling {
    private let soundQueuer: SoundQueuing = SoundQueuer()

    private let gameServiceClient: Werewolf_GameServiceService
    private let userID: String
    private let roomID: String
    private let isHost: Bool

    private let game = BehaviorRelay<Werewolf_Game?>(value: nil)
    private let seats = BehaviorRelay<[Werewolf_Seat]?>(value: nil)
    private let seatTaken = BehaviorRelay<Werewolf_Seat?>(value: nil)
    private let showingRole = BehaviorRelay<Bool>(value: false)
    var disposeBag = DisposeBag()

    func dispose() {
        disposeBag = DisposeBag()
    }

    init(roomID: String, userID: String, client: Werewolf_GameServiceService, isHost: Bool = false) {
        self.roomID = roomID
        self.userID = userID
        self.gameServiceClient = client
        self.isHost = isHost

        var req = Werewolf_GetRoomRequest()
        req.roomID = self.roomID
        Observable<Int>
            .timer(RxTimeInterval(0), period: RxTimeInterval(0.5), scheduler: ConcurrentDispatchQueueScheduler(qos: .background))
            .flatMapLatest { _ -> Observable<Werewolf_GetRoomResponse> in
                return self.gameServiceClient.getRoomRx(req)
            }
            .flatMapLatest({ (res) -> Observable<Werewolf_Room> in
                Observable.just(res.room)
            })
            .distinctUntilChanged()
            .subscribe(onNext: { (room) in
                self.seats.accept(room.seats)
                self.game.accept(room.game)
            }, onError: nil)
            .disposed(by: disposeBag)

        seats
            .distinctUntilChanged()
            .subscribe(onNext: { (seats) in
                if let seat = seats?.first(where: { $0.user.id == self.userID }) {
                    self.seatTaken.accept(seat)
                }
            }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)

        game
            .asObservable()
            .flatMapLatest {
                Observable.just($0?.state)
            }
            .distinctUntilChanged()
            .subscribeOn(SerialDispatchQueueScheduler(internalSerialQueueName: "sound stream"))
            .scan(nil, accumulator: { (previous, current) -> Werewolf_Game.State? in
                if let s = previous, let sound = Sound.getClosingSound(forState: s), self.isHost  {
                    self.soundQueuer.queue(sound)
                }

                return current
            })
            .subscribe(onNext: { (state) in
                guard let s = state, let sound = Sound.getOpeningSound(forState: s), self.isHost else {
                    return
                }

                self.soundQueuer.queue(sound)
            }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }

    func drive(controller: RoomViewController) {
        controller.roomNumberLabel.text = R.string.localizable.roomLabelTemplate(roomID)
        driveSeatsVisibility(controller)
        driveSeatButtonPressed(controller)
        driveRoleImageVisibility(controller)

        controller.startGameBtn.rx.tap
            .flatMapLatest({_ -> Observable<Werewolf_StartGameResponse> in
                var req = Werewolf_StartGameRequest()
                req.roomID = self.roomID
                return self.gameServiceClient.startGameRx(req)
            })
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (_) in
                controller.showSnackbar(withMessage: R.string.localizable.gameStartedSnackMessage())
            }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)

        controller.lastNightInfoBtn.rx.tap
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (_) in
                let killedSeatIndices = self.game.value?.killedSeatIds.compactMap({ (seatID) -> String? in
                    guard let i = self.seats.value?.index(where: { $0.id == seatID }) else {
                        return nil
                    }
                    return String(i + 1)
                })
                guard let killedSeatString = killedSeatIndices?.joined(separator: ",") else {
                    return
                }

                let msg = killedSeatString.isEmpty ? R.string.localizable.peacefulNightSnackMessage() : R.string.localizable.killedPlayersMessageTemplate(killedSeatString)
                controller.showAlert(for: nil, orMessage: msg)
            }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)

        controller.takeActionBtn.rx.tap
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (_) in
                self.onUseSkillButtonPressed(controller)
            }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)

        controller.assignRoleBtn.rx.tap
            .flatMapLatest({_ -> Observable<Werewolf_ReassignRolesResponse> in
                var req = Werewolf_ReassignRolesRequest()
                req.roomID = self.roomID
                return self.gameServiceClient.reassignRolesRx(req)
            })
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (_) in
                controller.showAlert(for: nil, orMessage: R.string.localizable.reassignRoleSuccess())
            }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
}

extension RoomViewModel {
    func driveSeatsVisibility(_ controller: RoomViewController) {
        seats
            .distinctUntilChanged()
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { (seatsOption) in
                guard let seats = seatsOption, let seatBtns = controller.seatButtons else {
                    return
                }

                for i in 0..<seats.count {
                    seatBtns[i].alpha = 1.0
                    seatBtns[i].backgroundColor = seats[i].hasUser ? .seatTaken : .seatVacant;
                }

                for i in seats.count..<seatBtns.count {
                    seatBtns[i].alpha = 0.0
                }
            }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }

    func driveRoleImageVisibility(_ controller: RoomViewController) {
        seatTaken
            .distinctUntilChanged()
            .flatMapLatest({ (seat) -> Observable<Bool> in
                return Observable.just(seat == nil)
            })
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { (hasNotTakenSeat) in
                controller.roleImageView.isHidden = hasNotTakenSeat
            }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)

        let roleImageStream = seatTaken
            .distinctUntilChanged()
            .flatMapLatest { (seat) -> Observable<UIImage?> in
                guard let role = seat?.role else {
                    return Observable.just(nil)
                }

                return Observable.just(UIImage.image(forRole: role))
            }

        Observable
            .combineLatest(roleImageStream, showingRole.asObservable()) { (role, showing) -> UIImage? in
                return showing ? role : #imageLiteral(resourceName: "卡背")
            }
            .bind(to: controller.roleImageView.rx.image)
            .disposed(by: disposeBag)
    }

    func driveSeatButtonPressed(_ controller: RoomViewController) {
        Observable
            .merge(controller.seatButtons
                .compactMap { (button) -> Observable<MDCButton> in
                    return button.rx.tap.flatMapLatest({ (_) -> Observable<MDCButton> in
                        return Observable.just(button)
                    })
            })
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { (button) in
                self.tryHandleRoleSkill(button, controller)
                self.tryHandleSeatTaking(button, controller)
            }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
}

extension RoomViewModel {
    func tryHandleRoleSkill(_ seatButton: MDCButton, _ controller: RoomViewController) {
        guard let gameState = game.value?.state, let role = seatTaken.value?.role, let seatID = seats.value?[seatButton.number - 1].id, let gameID = game.value?.id else {
            return
        }

        var req = Werewolf_TakeActionRequest()
        req.gameID = gameID
        switch gameState {
        case .seerAwake:
            if role != .seer {
                return
            }
            req.seer.seatID = seatID
            gameServiceClient
                .takeActionRx(req)
                .observeOn(MainScheduler.asyncInstance)
                .subscribe(onNext: { (res) in
                    let msg = (res.seer.ruling == .positive) ? R.string.localizable.seerActionRulingPositive() : R.string.localizable.seerActionRulingNegative()
                    controller.showSnackbar(withMessage: "\(msg)")
                })
                .disposed(by: disposeBag)
        case .halfBloodAwake:
            if role != .halfBlood {
                return
            }
            req.halfBlood.seatID = seatID
            gameServiceClient
                .takeActionRx(req)
                .observeOn(MainScheduler.asyncInstance)
                .subscribe(onNext: { (_) in
                    controller.showSnackbar(withMessage: "榜样设立成功")
                }, onError: nil, onCompleted: nil, onDisposed: nil)
                .disposed(by: disposeBag)
        case .guardianAwake:
            if role != .guardian {
                return
            }
            req.guard.seatID = seatID
            gameServiceClient
                .takeActionRx(req)
                .observeOn(MainScheduler.asyncInstance)
                .subscribe(onNext: { (_) in
                    controller.showSnackbar(withMessage: "守卫成功")
                }, onError: nil, onCompleted: nil, onDisposed: nil)
                .disposed(by: disposeBag)
        case .werewolfAwake:
            if role != .werewolf && role != .whiteWerewolf {
                return
            }
            req.werewolf.seatID = seatID
            gameServiceClient
                .takeActionRx(req)
                .observeOn(MainScheduler.asyncInstance)
                .subscribe(onNext: { (_) in
                    controller.showSnackbar(withMessage: R.string.localizable.wolfKillSuccess())
                }, onError: nil, onCompleted: nil, onDisposed: nil)
                .disposed(by: disposeBag)
        default:
            break
        }
    }

    func tryHandleSeatTaking(_ seatButton: MDCButton, _ controller: RoomViewController) {
        guard let seatID = seats.value?[seatButton.number - 1].id,
            let hasUser = seats.value?[seatButton.number - 1].hasUser,
            !hasUser else {
                return
        }

        var req = Werewolf_TakeSeatRequest()
        req.seatID = seatID
        req.userID = userID

        gameServiceClient
            .takeSeatRx(req)
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { (_) in
                controller.showSnackbar(withMessage: R.string.localizable.takeSeatSuccessTemplate(seatButton.number))
            }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
}

extension RoomViewModel {
    @objc func onRoleImageViewPressed(_ sender: UITapGestureRecognizer) {
        self.showingRole.accept(!self.showingRole.value)
    }

    func onUseSkillButtonPressed(_ controller: RoomViewController) {
        guard let role = self.seatTaken.value?.role, let gameID = self.game.value?.id else {
            return
        }

        var req = Werewolf_TakeActionRequest()
        req.gameID = gameID
        switch role {
        case .seer,
             .guardian,
             .werewolf,
             .halfBlood:
            controller.showSnackbar(withMessage: R.string.localizable.chooseTargetSnackMessage())
        case .hunter:
            req.hunter = Werewolf_TakeActionRequest.HunterAction()
            self.gameServiceClient
                .takeActionRx(req)
                .observeOn(MainScheduler.asyncInstance)
                .subscribe(onNext: { (res) in
                    let msg = (res.seer.ruling == .positive) ? R.string.localizable.hunterActionRulingPositive() : R.string.localizable.hunterActionRulingNegative()
                    controller.showSnackbar(withMessage: "\(msg)")
                })
                .disposed(by: self.disposeBag)
        case .witch:
            let killedSeatID = self.game.value?.killedSeatIds.first
            let killedSeatNumber = self.seats.value?.index(where: { (seat) -> Bool in
                seat.id == killedSeatID
            }) ?? 0 + 1
            let witchActionMessage = killedSeatID != nil ? R.string.localizable.witchActionKilledTemplate(killedSeatNumber) : R.string.localizable.witchActionNoDeath()
            let alert = UIAlertController(title: R.string.localizable.witchActionTitle(), message: witchActionMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: R.string.localizable.wtichActionSave(), style: .default, handler: { (_) in
                guard let cureSeatID = self.seats.value?.first(where: { (seat) -> Bool in
                    seat.id == killedSeatID
                })?.id else {
                    return
                }
                var req = Werewolf_TakeActionRequest()
                req.witch.cureSeatID = cureSeatID
                req.gameID = self.game.value?.id ?? ""
                self.gameServiceClient
                    .takeActionRx(req)
                    .observeOn(MainScheduler.asyncInstance)
                    .subscribe(onNext: { (res) in
                        controller.showSnackbar(withMessage: R.string.localizable.witchActionSaveSuccess())
                    }, onError: nil, onCompleted: nil, onDisposed: nil)
                    .disposed(by: self.disposeBag)
            }))
            alert.addTextField{
                $0.placeholder = R.string.localizable.witchActionPoisonTextfieldPlaceholder()
                $0.keyboardType = .numberPad
            }
            alert.addAction(UIAlertAction(title: R.string.localizable.witchActionPoison(), style: .destructive, handler: { (_) in
                guard let text = alert.textFields?.first?.text,
                    let poisonSeatNumber = Int(text),
                    let poisonedSeatID = self.seats.value?[safe: poisonSeatNumber - 1]?.id,
                    let gameID = self.game.value?.id else {
                        return
                }

                var req = Werewolf_TakeActionRequest()
                req.witch.poisonSeatID = poisonedSeatID
                req.gameID = gameID
                self.gameServiceClient
                    .takeActionRx(req)
                    .observeOn(MainScheduler.asyncInstance)
                    .subscribe(onNext: { (res) in
                        controller.showSnackbar(withMessage: R.string.localizable.witchActionPoisonSuccess())
                    }, onError: nil, onCompleted: nil, onDisposed: nil)
                    .disposed(by: self.disposeBag)
            }))
            controller.present(alert, animated: true, completion: nil)
        default:
            break
        }
    }

}
