//
//  SettingsService.swift
//  op131Lehi_iOS
//
//  Created by Michael Huber Jr on 3/11/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import Foundation

final class SettingsService {
    
    var userAuthKey: String? {
        // TODO: Return NSUserDefaults
        return ""
    }
    
    var userLoggedIn: Bool {
       return userAuthKey != nil
    }
    
    func accountLoggedIn(withAuthKey: String) {
        // TODO: Store vapor-auth key in NSUserDefaults
    }
    
}
