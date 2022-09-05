//
//  ApplicationModule.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import SwinjectStoryboard

public extension SwinjectStoryboard {
    
    // MARK: - Properties
    
    static let synchronizedResolver = defaultContainer.synchronize()
    
    
    // MARK: - Setup
    
    class func setup() {
        DataModule.setup(defaultContainer)
        ViewModule.setup(defaultContainer)
    }
    
}
