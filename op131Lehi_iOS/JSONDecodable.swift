//
//  JSONDecodable.swift
//  op131Lehi_iOS
//
//  Created by Michael Huber Jr on 3/12/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import Foundation

typealias JSONType = [String: Any]

protocol JSONDecodable {
    associatedtype DataType

    init?(JSON: JSONType)
    func json(fromData data: DataType) -> JSONType
}
