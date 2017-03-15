//
//  ProfileService.swift
//  op131Lehi_iOS
//
//  Created by Michael Huber Jr on 3/13/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import Foundation

class ProfileService: Client {

    func fetch(_ endpoint: Endpoints.UsersEndpoint) {
        guard let url = URL(string: endpoint.baseURL) else { return }

        let parameters = endpoint.parameters as? [String: String]

        Network.performRequest(for: url, httpMethod: endpoint.requestType, urlParameters: parameters, body: nil) { data, error in


        }
    }

    func post(_ endpoint: Endpoints.UsersEndpoint) {

    }

    func update(_ endpoint: Endpoints.UsersEndpoint) {

    }

    func delete(_ endpoint: Endpoints.UsersEndpoint) {

    }

}
