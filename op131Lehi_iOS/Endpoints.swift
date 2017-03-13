//
//  op131LehiEndpoints.swift
//  op131Lehi_iOS
//
//  Created by Michael Huber Jr on 3/12/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import Foundation

enum Endpoints: Endpoint {

    // MARK: - Users Endpoint

    case Users(UsersEndpoint)

    enum UsersEndpoint: Endpoint {
        case register
        case update
        case login
        case logout
        case messages(username: String)

        var baseURL: String {
            return "https://op131.com/op131Lehi/users"
        }

        var path: String {
            switch self {
            case .register: return "/register"
            case .update, .messages: return "/"
            case .login: return "/login"
            case .logout: return "/logout"
            }
        }

        var parameters: JSONType? {
            switch self {
            case .messages(let username):
                let parameters: JSONType = [
                    Keys.username: username]
                return parameters
            case .register, .update, .login, .logout: return nil
            }
        }

        var requestType: RequestType {
            switch self {
            case .logout, .messages: return .get
            case .register, .login, .update: return .post
            }
        }

    }

    // MARK: - Messages Endpoint

    case Messages(MessagesEndpoint)

    enum MessagesEndpoint: Endpoint {
        case fetchAll
        case fetch(messageID: Int)
        case post
        case update
        case delete

        var baseURL: String {
            return "https:op131.com/op131Lehi/messages"
        }

        var path: String {
            switch self {
            case .fetchAll, .fetch, .post, .update, .delete: return "/"
            }
        }

        var parameters: JSONType? {
            switch self {
            case .fetch(let messageID):
                let parameters: JSONType = [
                    Keys.messageID: messageID]
                return parameters
            case .fetchAll, .post, .update, .delete: return nil
            }
        }

        var requestType: RequestType {
            switch self {
            case .fetch, .fetchAll: return .get
            case .post, .update: return .post
            case .delete: return .delete
            }
        }

    }

    // MARK: - Endpoints Endpoint

    var baseURL: String {
        switch self {
        case .Users(let endpoint):
            return endpoint.baseURL
        case .Messages(let endpoint):
            return endpoint.baseURL
        }
    }

    var path: String {
        switch self {
        case .Users(let endpoint):
            return endpoint.path
        case .Messages(let endpoint):
            return endpoint.path
        }
    }

    var parameters: JSONType? {
        switch self {
        case .Users(let endpoint):
            return endpoint.parameters
        case .Messages(let endpoint):
            return endpoint.parameters
        }
    }

    var requestType: RequestType {
        switch self {
        case .Users(let endpoint):
            return endpoint.requestType
        case .Messages(let endpoint):
            return endpoint.requestType
        }
    }

}
