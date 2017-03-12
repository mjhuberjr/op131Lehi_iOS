//
//  Main.swift
//  op131Lehi_iOS
//
//  Created by Michael Huber Jr on 3/11/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import UIKit

final class Main: UIViewController, StoryboardInitializable {

    // MARK: - ViewControllers

    fileprivate lazy var loading = UINavigationController(rootViewController: Loading.initializeFromStoryboard())
    fileprivate lazy var mainApp = MainApp.initializeFromStoryboard()
    fileprivate lazy var login = Login.initializeFromStoryboard()

    // MARK: - Lifecycle

}

// MARK: - Private methods

extension Main {

}
