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
        let vc = CategoriesViewController.instantiate(storyboard: .categories)
        return Screen(viewController: vc, isModal: false, animated: true)
    }

}
