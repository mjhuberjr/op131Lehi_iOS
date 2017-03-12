//
//  AppDelegate.swift
//  op131Lehi_iOS
//
//  Created by Michael Huber Jr on 3/11/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Crashlytics.self])

        loadMain()
        return true
    }

}

// MARK: - Private Methods

private extension AppDelegate {
    
    func loadMain() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let main = Main.initializeFromStoryboard()
        window?.rootViewController = main
        window?.makeKeyAndVisible()
        
        AppearanceService.customize()
    }
    
}

