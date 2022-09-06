//
//  WireframeImpl.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import UIKit
import SwinjectStoryboard

public class WireframeImpl: Wireframe {

    // MARK: - Init
    
    public init() {}
    
    
    // MARK: - Implementation
    
    public func categories() -> Screen {
        let viewController = CategoriesViewController.instantiate(storyboard: .categories)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        return Screen(viewController: navigationController, isModal: false, animated: true)
    }
    
    public func news(with category: String) -> Screen {
        let viewController = NewsViewController.instantiate(storyboard: .news)
        viewController.presenter.setup(category: category)
        
        return Screen(viewController: viewController, isModal: false, animated: true)
    }

}
