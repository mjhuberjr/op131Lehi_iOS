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
    func fetch(_ endpoint: Endpoint, request: FetchRequest)
    func post(_ endpoint: Endpoint, using data: JSONType)
    func update(_ endpoint: Endpoint, data: JSONType, withNewData: JSONType)
    func delete(_ endpoint: Endpoint, object: JSONType)
}
