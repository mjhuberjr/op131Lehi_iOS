//
//  AppearanceService.swift
//  op131Lehi_iOS
//
//  Created by Michael Huber Jr on 3/11/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import UIKit

enum AppearanceService {

    static func customize() {
        UIApplication.shared.delegate?.window??.tintColor = UIColor.customOrange()
    }

}
