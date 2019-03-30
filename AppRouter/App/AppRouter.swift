//
//  AppRouter.swift
//  AppRouter
//
//  Created by 유현재 on 24/03/2019.
//  Copyright © 2019 유현재. All rights reserved.
//

import UIKit

class AppRouter: NSObject {
    static let shared = AppRouter()
    
    private var rootNavigationController: UINavigationController?
    
    private var currentNavigationController: UINavigationController?
    private var currentViewController: UIViewController?
}

// View Function

extension AppRouter {
    func request(_ screen: AppScreen) {
        var nextViewController: UIViewController?
        
        switch screen {
        case .firstScreen:
            let rootViewController = (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController
            if let navi = rootViewController as? UINavigationController {
                currentViewController = navi
                rootNavigationController = navi
                rootNavigationController?.delegate = self
                nextViewController = navi.viewControllers.first
            } else {
                nextViewController = (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController
            }
        case .secondScreen:
            nextViewController = SecondViewController(screen: .secondScreen)
            nextViewController?.hidesBottomBarWhenPushed = false
            pushViewController(nextViewController, navigationBarHidden: false, animated: true)
        case .thirdScreen:
            nextViewController = ThirdViewController(screen: .thirdScreen)
            nextViewController?.hidesBottomBarWhenPushed = false
            pushViewController(nextViewController, navigationBarHidden: false, animated: true)
        case .forthScreen:
            nextViewController = ForthViewController(screen: .forthScreen)
            nextViewController?.hidesBottomBarWhenPushed = false
            pushViewController(nextViewController, navigationBarHidden: false, animated: true)
        }
    }
}

// View Move Function
extension AppRouter {
    private func pushViewController(_ viewController: UIViewController?, navigationBarHidden: Bool, animated: Bool) {
        if let viewController = viewController, let currentViewController = currentViewController {
            if currentViewController.navigationController != rootNavigationController {
                currentViewController.navigationController?.setNavigationBarHidden(navigationBarHidden, animated: animated)
            }
            currentViewController.navigationController?.pushViewController(viewController, animated: animated)
        }
    }
    
    private func popViewController() {
        if let currentNavigationController = currentNavigationController, currentNavigationController != rootNavigationController {
            currentNavigationController.popViewController(animated: false)
        }
    }
}

// Delegate

extension AppRouter: UINavigationControllerDelegate {
    func navigationController(_ : UINavigationController, willShow viewController: UIViewController, animated: Bool) {}
    func navigationController(_ : UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if let navi = viewController as? UINavigationController {
            currentNavigationController = navi
            currentViewController = navi.topViewController
        } else {
            currentViewController = viewController
        }
    }
}
