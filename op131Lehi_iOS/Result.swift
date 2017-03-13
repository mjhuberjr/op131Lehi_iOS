//
//  Result.swift
//  op131Lehi_iOS
//
//  Created by Michael Huber Jr on 3/12/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(T)
    case faulure(Error)
}
