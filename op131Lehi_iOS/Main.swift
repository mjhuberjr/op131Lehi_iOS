//
//  Main.swift
//  op131Lehi_iOS
//
//  Created by Michael Huber Jr on 3/11/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import UIKit

final class Main: UIViewController, StoryboardInitializable {

    // MARK: - Private properties

    fileprivate var currentViewController: UIViewController?
    fileprivate var isShowingApp = false

    // MARK: - ViewControllers

    fileprivate lazy var loading = UINavigationController(rootViewController: Loading.initializeFromStoryboard())
    fileprivate lazy var mainApp = MainApp.initializeFromStoryboard()
    fileprivate lazy var login = UINavigationController(rootViewController:Login.initializeFromStoryboard())

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        showLoading()

        if !SettingsService.shared.userLoggedIn {
            showLogin()
        } else if !isShowingApp {
            showMainApp()
        }
    }

}

// MARK: - Private methods

extension Main {
    func showLoading() {
        show(loading)
    }
    
    func showMainApp() {
        isShowingApp = true
        show(mainApp, animationOptions: .transitionCrossDissolve)
    }
    
    func showLogin() {
        show(login, animationOptions: .transitionCrossDissolve)
    }

    func show(_ viewController: UIViewController, animationOptions: UIViewAnimationOptions? = nil) {
        guard currentViewController != viewController else { return }

        if let presentedViewController = presentedViewController {
            presentedViewController.dismiss(animated: false, completion: nil)
        }

        if let animationOptions = animationOptions {
            guard let currentViewController = currentViewController else { return}

            addChildViewController(viewController)
            viewController.view.frame = currentViewController.view.frame
            transition(from: currentViewController,
                       to: viewController, duration: 0.3,
                       options: animationOptions,
                       animations: nil) { finished in

                        currentViewController.removeFromParentViewController()
            }
        } else {
            if let controller = currentViewController {
                controller.removeFromParentViewController()
                controller.view.removeFromSuperview()
                viewController.view.frame = controller.view.frame
            }

            addChildViewController(viewController)
            view.addSubview(viewController.view)
        }

        currentViewController = viewController
    }
}
