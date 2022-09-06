//
//  UIApplication+TopViewController.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import UIKit

extension UIApplication {
    
    var statusBarView: UIView? {
        let tag = 38482
        let keyWindow = UIApplication.topViewController()?.view.window ?? UIApplication.shared.windows.first
        if let statusBar = keyWindow?.viewWithTag(tag) {
            return statusBar
        } else {
            guard let statusBarFrame = keyWindow?.windowScene?.statusBarManager?.statusBarFrame else {
                return nil
            }
            let statusBarView = UIView(frame: statusBarFrame)
            statusBarView.tag = tag
            keyWindow?.addSubview(statusBarView)
            return statusBarView
        }
    }
    
    var statusBarHeight: CGFloat {
        return UIApplication.shared.windows.first(where: \.isKeyWindow)?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    /// Height of status bar + navigation bar (if navigation bar exist)
    var navigationBarHeight: CGFloat {
        let statusBar: CGFloat = UIApplication.shared.statusBarFrame.height
        let navigationBar: CGFloat = UIApplication.topViewController()?.navigationController?.navigationBar.frame.height ?? 0.0
        return statusBar + navigationBar
    }
    
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
    
    class func baseNavigationController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return baseNavigationController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return baseNavigationController(selected)
            }
        }
        return nil
    }

    class func openSettings() {
        if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
        }
    }

}
