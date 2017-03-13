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
                var parameters: JSONType = [
                    Keys.username: username]
                return parameters
            default: return nil
            }
        }

    }

    // MARK: - Messages Endpoint

    case Messages(MessagesEndpoint)

    // MARK: - Endpoints Endpoint

    var baseURL: String {
        switch self {
        case .Users(let endpoint):
            return endpoint.baseURL
        }
    }

    var path: String {
        switch self {
        case .Users(let endpoint):
            return endpoint.path
        }
    }

    var parameters: JSONType? {
        switch self {
        case.Users(let endpoint):
            return endpoint.parameters
        }
    }

}
