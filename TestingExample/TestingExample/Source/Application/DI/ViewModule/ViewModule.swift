//
//  ViewModule.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import Swinject
import SwinjectStoryboard

public class ViewModule {
    
    // MARK: - Public methods
    
    public static func setup(_ defaultContainer: Container) {
        // Common dependencies
        resolveCommonDependencies(defaultContainer)

        // Module dependencies
        NewsViewModule().setup(defaultContainer)
        
        // ... (Register new modules)
    }
    
    
    // MARK: - Private methods
    
    private static func resolveCommonDependencies(_ defaultContainer: Container) {
        defaultContainer.register(Wireframe.self) { _ in
            WireframeImpl()
        }.inObjectScope(.container)
        
        defaultContainer.register(BasePresenter.self) { _ in
            BasePresenter(schedulers: SwinjectStoryboard.synchronizedResolver.resolve(Schedulers.self)!)
        }
    }
    
}
