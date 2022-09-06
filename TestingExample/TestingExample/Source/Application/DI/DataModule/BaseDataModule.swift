//
//  BaseDataModule.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import Swinject

public class BaseDataModule {
    
    public func setup(_ defaultContainer: Container) {
        resolveSingletons(defaultContainer)
        resolveFactories(defaultContainer)
        resolveProviders(defaultContainer)
        resolveRepositories(defaultContainer)
        resolveServices(defaultContainer)
        resolveUseCases(defaultContainer)
    }
    
    func resolveRepositories(_ defaultContainer: Container) {}
    
    func resolveServices(_ defaultContainer: Container) {}
    
    func resolveUseCases(_ defaultContainer: Container) {}
    
    func resolveFactories(_ defaultContainer: Container) {}
    
    func resolveProviders(_ defaultContainer: Container) {}
    
    func resolveSingletons(_ defaultContainer: Container) {}
    
}
