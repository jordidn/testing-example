//
//  BaseViewController+Navigation.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import Foundation
import UIKit

extension BaseViewController {
    
    func setupNavigationbar(title: String? = "",
                            titleTextAttributes: [NSAttributedString.Key : Any]? = [:],
                            backgroundImage: UIImage? = UIImage()) {
        if let nav = navigationController {
            if let titleTextAttributes = titleTextAttributes, !titleTextAttributes.isEmpty {
                nav.navigationBar.titleTextAttributes = titleTextAttributes
            } else {
                nav.navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 15)]
            }
            nav.navigationBar.setBackgroundImage(backgroundImage, for: UIBarMetrics.default)
        }
        
        navigationItem.title = title
    }
    
    
    // MARK: - Back Button
    
    func addBackButton() {
        let showsBack = (navigationController?.viewControllers.count ?? 0) > 1
        
        ///Always create the back button without title, so that it never shows the title.
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = item
        
        if isBeingPresented || (navigationController?.isBeingPresented ?? false) {
            if !showsBack {
                let cancelImage = UIImage(systemName: "multiply")
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: cancelImage,
                                                                   style: .plain,
                                                                   target: self,
                                                                   action: #selector(goBack))
                navigationItem.hidesBackButton = true
            } else {
                let arrowImage = UIImage(systemName: "chevron.left")
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: arrowImage,
                                                                   style: .plain,
                                                                   target: self,
                                                                   action: #selector(goBack))
                navigationItem.hidesBackButton = false
            }
        }
    }
    
    func hideBackButton() {
        navigationItem.leftBarButtonItem = nil
    }
    
    
    // MARK: - Navigation Bar visibility
    
    func showNavigationBar(with color: UIColor = .white) {
        navigationController?.navigationBar.backgroundColor = color
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func hideNavigationBar(animated: Bool = true) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}
