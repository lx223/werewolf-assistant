//
//  RoomViewController.swift
//  werewolf-assistant
//
//  Created by Lan Xiao on 15/06/2018.
//  Copyright © 2018 Lan Xiao. All rights reserved.
//

import UIKit
import MaterialComponents
import Floaty

class RoomViewController: UIViewController {

    @IBOutlet var seatButtons: [MDCButton]!
    @IBOutlet weak var roleImageView: UIImageView!
    let roomNumberLabel = UILabel()
    let floatingBtn = Floaty()

    let viewModel: RoomViewModeling

    init(viewModel: RoomViewModeling) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(floatingBtn)

        let rightBarButtonItem = UIBarButtonItem(customView: roomNumberLabel)
        navigationItem.setRightBarButton(rightBarButtonItem, animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.drive(controller: self)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        viewModel.dispose()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
