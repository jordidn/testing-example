//
//  Wireframe.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import Foundation
import UIKit

enum StoryboardNames: String {
    case categories
    case news
}

public protocol Wireframe {
    func categories() -> Screen
    func news(with category: String) -> Screen
}

public extension Wireframe {
    
    // MARK: - Pop current screen
    func popCurrentScreen() {
        popCurrentScreen(animated: true)
    }
    
    func popCurrentScreen(onCompletion: @escaping() -> Void) {
        popCurrentScreen(animated: true, onCompletion: onCompletion)
    }
    
    func popCurrentScreen(animated: Bool) {
        popCurrentScreen(animated: animated) {}
    }
    
    // MARK: - Pop To ViewController
    
    func popToViewController(_ vc: UIViewController.Type) {
        guard let nav = UIApplication.topViewController()?.parent as? UINavigationController else { return }
        for controller in nav.viewControllers {
            if controller.isKind(of: vc) {
                nav.popToViewController(controller, animated: true)
                return
            }
        }
    }
    
    
    
    func popCurrentScreen(animated: Bool, onCompletion: @escaping () -> Void) {
        // Pop if there is a Navigation Controller
        DispatchQueue.main.async {
            if let navigationController = UIApplication.topViewController()?.parent as? UINavigationController, navigationController.viewControllers.count > 1 {
                navigationController.popViewController(animated: animated, completion: onCompletion)
            } else { // If not, dismiss
                UIApplication.topViewController()?.dismiss(animated: animated, completion: onCompletion)
            }
        }
    }
    
    func dismissScreen(animated: Bool, onCompletion: @escaping () -> Void) {
        UIApplication.topViewController()?.dismiss(animated: animated, completion: onCompletion)
    }
    
}


private extension UINavigationController {
    
    //Same function as "popViewController", but allow us to know when this function ends
    func popViewController(animated: Bool, completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: animated)
        CATransaction.commit()
    }
    
    func pushViewController(viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
}
