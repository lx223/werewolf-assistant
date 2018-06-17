//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: werewolf.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Foundation
import Dispatch
import SwiftGRPC
import SwiftProtobuf

internal protocol Werewolf_GameServiceCreateAndJoinRoomCall: ClientCallUnary {}

fileprivate final class Werewolf_GameServiceCreateAndJoinRoomCallBase: ClientCallUnaryBase<Werewolf_CreateAndJoinRoomRequest, Werewolf_CreateAndJoinRoomResponse>, Werewolf_GameServiceCreateAndJoinRoomCall {
  override class var method: String { return "/werewolf.GameService/CreateAndJoinRoom" }
}

internal protocol Werewolf_GameServiceUpdateGameConfigCall: ClientCallUnary {}

fileprivate final class Werewolf_GameServiceUpdateGameConfigCallBase: ClientCallUnaryBase<Werewolf_UpdateGameConfigRequest, Werewolf_UpdateGameConfigResponse>, Werewolf_GameServiceUpdateGameConfigCall {
  override class var method: String { return "/werewolf.GameService/UpdateGameConfig" }
}

internal protocol Werewolf_GameServiceJoinRoomCall: ClientCallUnary {}

fileprivate final class Werewolf_GameServiceJoinRoomCallBase: ClientCallUnaryBase<Werewolf_JoinRoomRequest, Werewolf_JoinRoomResponse>, Werewolf_GameServiceJoinRoomCall {
  override class var method: String { return "/werewolf.GameService/JoinRoom" }
}

internal protocol Werewolf_GameServiceGetRoomCall: ClientCallUnary {}

fileprivate final class Werewolf_GameServiceGetRoomCallBase: ClientCallUnaryBase<Werewolf_GetRoomRequest, Werewolf_GetRoomResponse>, Werewolf_GameServiceGetRoomCall {
  override class var method: String { return "/werewolf.GameService/GetRoom" }
}

internal protocol Werewolf_GameServiceTakeSeatCall: ClientCallUnary {}

fileprivate final class Werewolf_GameServiceTakeSeatCallBase: ClientCallUnaryBase<Werewolf_TakeSeatRequest, Werewolf_TakeSeatResponse>, Werewolf_GameServiceTakeSeatCall {
  override class var method: String { return "/werewolf.GameService/TakeSeat" }
}

internal protocol Werewolf_GameServiceReassignRolesCall: ClientCallUnary {}

fileprivate final class Werewolf_GameServiceReassignRolesCallBase: ClientCallUnaryBase<Werewolf_ReassignRolesRequest, Werewolf_ReassignRolesResponse>, Werewolf_GameServiceReassignRolesCall {
  override class var method: String { return "/werewolf.GameService/ReassignRoles" }
}

internal protocol Werewolf_GameServiceStartGameCall: ClientCallUnary {}

fileprivate final class Werewolf_GameServiceStartGameCallBase: ClientCallUnaryBase<Werewolf_StartGameRequest, Werewolf_StartGameResponse>, Werewolf_GameServiceStartGameCall {
  override class var method: String { return "/werewolf.GameService/StartGame" }
}

internal protocol Werewolf_GameServiceGetGameCall: ClientCallUnary {}

fileprivate final class Werewolf_GameServiceGetGameCallBase: ClientCallUnaryBase<Werewolf_GetGameRequest, Werewolf_GetGameResponse>, Werewolf_GameServiceGetGameCall {
  override class var method: String { return "/werewolf.GameService/GetGame" }
}

internal protocol Werewolf_GameServiceTakeActionCall: ClientCallUnary {}

fileprivate final class Werewolf_GameServiceTakeActionCallBase: ClientCallUnaryBase<Werewolf_TakeActionRequest, Werewolf_TakeActionResponse>, Werewolf_GameServiceTakeActionCall {
  override class var method: String { return "/werewolf.GameService/TakeAction" }
}


/// Instantiate Werewolf_GameServiceServiceClient, then call methods of this protocol to make API calls.
internal protocol Werewolf_GameServiceService: ServiceClient {
  /// Synchronous. Unary.
  func createAndJoinRoom(_ request: Werewolf_CreateAndJoinRoomRequest) throws -> Werewolf_CreateAndJoinRoomResponse
  /// Asynchronous. Unary.
  func createAndJoinRoom(_ request: Werewolf_CreateAndJoinRoomRequest, completion: @escaping (Werewolf_CreateAndJoinRoomResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceCreateAndJoinRoomCall

  /// Synchronous. Unary.
  func updateGameConfig(_ request: Werewolf_UpdateGameConfigRequest) throws -> Werewolf_UpdateGameConfigResponse
  /// Asynchronous. Unary.
  func updateGameConfig(_ request: Werewolf_UpdateGameConfigRequest, completion: @escaping (Werewolf_UpdateGameConfigResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceUpdateGameConfigCall

  /// Synchronous. Unary.
  func joinRoom(_ request: Werewolf_JoinRoomRequest) throws -> Werewolf_JoinRoomResponse
  /// Asynchronous. Unary.
  func joinRoom(_ request: Werewolf_JoinRoomRequest, completion: @escaping (Werewolf_JoinRoomResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceJoinRoomCall

  /// Synchronous. Unary.
  func getRoom(_ request: Werewolf_GetRoomRequest) throws -> Werewolf_GetRoomResponse
  /// Asynchronous. Unary.
  func getRoom(_ request: Werewolf_GetRoomRequest, completion: @escaping (Werewolf_GetRoomResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceGetRoomCall

  /// Synchronous. Unary.
  func takeSeat(_ request: Werewolf_TakeSeatRequest) throws -> Werewolf_TakeSeatResponse
  /// Asynchronous. Unary.
  func takeSeat(_ request: Werewolf_TakeSeatRequest, completion: @escaping (Werewolf_TakeSeatResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceTakeSeatCall

  /// Synchronous. Unary.
  func reassignRoles(_ request: Werewolf_ReassignRolesRequest) throws -> Werewolf_ReassignRolesResponse
  /// Asynchronous. Unary.
  func reassignRoles(_ request: Werewolf_ReassignRolesRequest, completion: @escaping (Werewolf_ReassignRolesResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceReassignRolesCall

  /// Synchronous. Unary.
  func startGame(_ request: Werewolf_StartGameRequest) throws -> Werewolf_StartGameResponse
  /// Asynchronous. Unary.
  func startGame(_ request: Werewolf_StartGameRequest, completion: @escaping (Werewolf_StartGameResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceStartGameCall

  /// Synchronous. Unary.
  func getGame(_ request: Werewolf_GetGameRequest) throws -> Werewolf_GetGameResponse
  /// Asynchronous. Unary.
  func getGame(_ request: Werewolf_GetGameRequest, completion: @escaping (Werewolf_GetGameResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceGetGameCall

  /// Synchronous. Unary.
  func takeAction(_ request: Werewolf_TakeActionRequest) throws -> Werewolf_TakeActionResponse
  /// Asynchronous. Unary.
  func takeAction(_ request: Werewolf_TakeActionRequest, completion: @escaping (Werewolf_TakeActionResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceTakeActionCall

}

internal final class Werewolf_GameServiceServiceClient: ServiceClientBase, Werewolf_GameServiceService {
  /// Synchronous. Unary.
  internal func createAndJoinRoom(_ request: Werewolf_CreateAndJoinRoomRequest) throws -> Werewolf_CreateAndJoinRoomResponse {
    return try Werewolf_GameServiceCreateAndJoinRoomCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  internal func createAndJoinRoom(_ request: Werewolf_CreateAndJoinRoomRequest, completion: @escaping (Werewolf_CreateAndJoinRoomResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceCreateAndJoinRoomCall {
    return try Werewolf_GameServiceCreateAndJoinRoomCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func updateGameConfig(_ request: Werewolf_UpdateGameConfigRequest) throws -> Werewolf_UpdateGameConfigResponse {
    return try Werewolf_GameServiceUpdateGameConfigCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  internal func updateGameConfig(_ request: Werewolf_UpdateGameConfigRequest, completion: @escaping (Werewolf_UpdateGameConfigResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceUpdateGameConfigCall {
    return try Werewolf_GameServiceUpdateGameConfigCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func joinRoom(_ request: Werewolf_JoinRoomRequest) throws -> Werewolf_JoinRoomResponse {
    return try Werewolf_GameServiceJoinRoomCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  internal func joinRoom(_ request: Werewolf_JoinRoomRequest, completion: @escaping (Werewolf_JoinRoomResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceJoinRoomCall {
    return try Werewolf_GameServiceJoinRoomCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func getRoom(_ request: Werewolf_GetRoomRequest) throws -> Werewolf_GetRoomResponse {
    return try Werewolf_GameServiceGetRoomCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  internal func getRoom(_ request: Werewolf_GetRoomRequest, completion: @escaping (Werewolf_GetRoomResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceGetRoomCall {
    return try Werewolf_GameServiceGetRoomCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func takeSeat(_ request: Werewolf_TakeSeatRequest) throws -> Werewolf_TakeSeatResponse {
    return try Werewolf_GameServiceTakeSeatCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  internal func takeSeat(_ request: Werewolf_TakeSeatRequest, completion: @escaping (Werewolf_TakeSeatResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceTakeSeatCall {
    return try Werewolf_GameServiceTakeSeatCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func reassignRoles(_ request: Werewolf_ReassignRolesRequest) throws -> Werewolf_ReassignRolesResponse {
    return try Werewolf_GameServiceReassignRolesCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  internal func reassignRoles(_ request: Werewolf_ReassignRolesRequest, completion: @escaping (Werewolf_ReassignRolesResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceReassignRolesCall {
    return try Werewolf_GameServiceReassignRolesCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func startGame(_ request: Werewolf_StartGameRequest) throws -> Werewolf_StartGameResponse {
    return try Werewolf_GameServiceStartGameCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  internal func startGame(_ request: Werewolf_StartGameRequest, completion: @escaping (Werewolf_StartGameResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceStartGameCall {
    return try Werewolf_GameServiceStartGameCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func getGame(_ request: Werewolf_GetGameRequest) throws -> Werewolf_GetGameResponse {
    return try Werewolf_GameServiceGetGameCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  internal func getGame(_ request: Werewolf_GetGameRequest, completion: @escaping (Werewolf_GetGameResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceGetGameCall {
    return try Werewolf_GameServiceGetGameCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func takeAction(_ request: Werewolf_TakeActionRequest) throws -> Werewolf_TakeActionResponse {
    return try Werewolf_GameServiceTakeActionCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  internal func takeAction(_ request: Werewolf_TakeActionRequest, completion: @escaping (Werewolf_TakeActionResponse?, CallResult) -> Void) throws -> Werewolf_GameServiceTakeActionCall {
    return try Werewolf_GameServiceTakeActionCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

}

