//
//  BaseViewModule.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import Swinject

public class BaseViewModule {
    
    private var defaultContainer: Container?
    
    func setup(_ defaultContainer: Container) {
        self.defaultContainer = defaultContainer
        resolvePresenters(defaultContainer)
        resolveViewControllers(defaultContainer)
    }
    
    func resolvePresenters(_ defaultContainer: Container) {}
    
    func resolveViewControllers(_ defaultContainer: Container) {}
    
//    func register<P>(vc: BaseViewController<P>.Type) {
//        if let container = self.defaultContainer {
//            container.storyboardInitCompleted(vc) { r, c in
//                c.presenter = SwinjectStoryboard.synchronizedResolver.resolve(vc.Presenter.self)!
//                c.presenter.wireframe = SwinjectStoryboard.synchronizedResolver.resolve(Wireframe.self)!
//            }
//        }
//    }
}
