//
//  Client.swift
//  op131Lehi_iOS
//
//  Created by Michael Huber Jr on 3/13/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import Foundation

enum FetchRequest {
    case all
    case id(id: Int)
    case key(key: String)
}

protocol Client {
    associatedtype EndpointType: Endpoint

    func fetch(_ endpoint: EndpointType)
    func post(_ endpoint: EndpointType)
    func update(_ endpoint: EndpointType)
    func delete(_ endpoint: EndpointType)
}
