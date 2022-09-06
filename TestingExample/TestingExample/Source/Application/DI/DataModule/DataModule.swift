//
//  DataModule.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import Swinject
import SwinjectStoryboard

public class DataModule {
    
    // MARK: - Public methods
    
    public static func setup(_ defaultContainer: Container) {
        // Common dependencies
        resolveCommonSingletons(defaultContainer)
        resolveCommonFactories(defaultContainer)
        resolveCommonProviders(defaultContainer)
        resolveCommonUseCases(defaultContainer)
        
        // Module dependencies
        NewsDataModule().setup(defaultContainer)
        
        // ... (Register new modules)
    }
    
    
    // MARK: - Private methods
    
    private static func resolveCommonSingletons(_ defaultContainer: Container) {
        defaultContainer.register(Schedulers.self) { _ in
            Schedulers()
        }.inObjectScope(.container)
    }
    
    private static func resolveCommonFactories(_ defaultContainer: Container) {
        // ... (Register common factories)
    }
    
    private static func resolveCommonProviders(_ defaultContainer: Container) {
        defaultContainer.register(GenericApiProvider.self) { _ in
            GenericApiProvider(schedulers: SwinjectStoryboard.synchronizedResolver.resolve(Schedulers.self)!)
        }
        
        defaultContainer.register(LocalProvider.self) { _ in
            LocalDataProvider()
        }.inObjectScope(.container)
    }
    
    private static func resolveCommonUseCases(_ defaultContainer: Container) {
        // ... (Register common useCases)
    }
    
}
