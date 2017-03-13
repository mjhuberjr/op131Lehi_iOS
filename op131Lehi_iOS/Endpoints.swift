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
        case messages

        var baseURL: String {
            return "https://op131.com"
        }

        var path: String {
            switch self {
            case .register: return "/register"
            case .update, .messages: return "/" // Need to return LehiUser.self
            case .login: return "/login"
            case .logout: return "/logout"
            }
        }

        var parameters: [String: Any]? {
            return nil
        }
    }

    // MARK: - Messages Endpoint

    case Messages(MessagesEndpoint)
}
