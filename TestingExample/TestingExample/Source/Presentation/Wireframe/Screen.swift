//
//  Screen.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import UIKit

public class Screen: NSObject {
    
    // MARK: - Properties
    
    private let viewController: UIViewController
    private let isModal: Bool
    private let animated: Bool
    
    
    // MARK: - Init
    
    init(viewController: UIViewController, isModal: Bool = false, animated: Bool = true) {
        self.viewController = viewController
        self.isModal = isModal
        self.animated = animated
    }
    
    
    // MARK: - Public methods
    
    public func get() -> UIViewController {
        return viewController
    }
    
    public func show(animated: Bool) {
        let isAnimated = animated
        if isModal {
            presentViewController(viewController, animated: isAnimated)
        } else {
            pushViewController(viewController, animated: isAnimated)
        }
    }
    
    public func presentSheet(animated: Bool) {
        viewController.modalPresentationStyle = .pageSheet
        UIApplication.topViewController()?.present(viewController, animated: animated, completion: nil)
    }
    
    public func replaceAppRootViewController() {
        guard let unwrappedWindow = UIApplication.shared.delegate?.window, let window = unwrappedWindow else {
            return
        }
        
        // Simulate the correct view lifecycle
        window.rootViewController?.viewWillDisappear(false)
        window.rootViewController?.viewDidDisappear(false)
        window.rootViewController?.dismiss(animated: false, completion: nil)
        
        // Change rootViewController
        window.rootViewController = viewController
        
        // Animation! (Using a snapshot of the previous root view controller)
        guard let snapshot = window.snapshotView(afterScreenUpdates: false) else {
            return
        }
        
        window.rootViewController?.view.addSubview(snapshot)
        
        UIView.animate(withDuration: 0.3, animations: {
            snapshot.layer.opacity = 0
            snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
        }, completion: { _ in
            snapshot.removeFromSuperview()
        })
    }
    
    
    // MARK: - Present Methods
    
    private func presentViewController(_ viewController: UIViewController, animated: Bool) {
        if viewController.modalPresentationStyle == .pageSheet {
            viewController.modalPresentationStyle = .fullScreen
        }
        UIApplication.topViewController()?.present(viewController, animated: animated, completion: nil)
    }
    
    
    // MARK: - Push Methods
    
    private func pushViewController(_ viewController: UIViewController, animated: Bool) {
        var viewController = viewController
        // Push if there is a Navigation Controller
        if let navigationController = UIApplication.topViewController()?.parent as? UINavigationController {
            // Get the last VC if it is inside of a stack
            if let viewControllerNVC = viewController as? UINavigationController,
               let lastViewController = viewControllerNVC.viewControllers.last {
                viewController = lastViewController
            }
            navigationController.pushViewController(viewController, animated: animated)
        } else { // If not, Present
            presentViewController(viewController, animated: animated)
        }
    }
    
}

