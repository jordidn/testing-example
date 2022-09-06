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

}
