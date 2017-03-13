//
//  Endpoint.swift
//  op131Lehi_iOS
//
//  Created by Michael Huber Jr on 3/12/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
}

extension Endpoint {
    var queryComponents: [NSURLQueryItem]? {
        guard let parameters = parameters else { return nil }
        var components = [NSURLQueryItem]()

        for (key, value) in parameters {
            let queryItem = NSURLQueryItem(name: key, value: "\(value)")
            components.append(queryItem)
        }

        return components
    }
}
