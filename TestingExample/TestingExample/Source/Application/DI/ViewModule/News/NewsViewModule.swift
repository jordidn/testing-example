//
//  NewsViewModule.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import Swinject
import SwinjectStoryboard

public class NewsViewModule: BaseViewModule {

    override func resolvePresenters(_ defaultContainer: Container) {
        defaultContainer.register(CategoriesPresenter.self) { _ in
            CategoriesPresenter(schedulers: SwinjectStoryboard.synchronizedResolver.resolve(Schedulers.self)!)
        }
    }
    
    override func resolveViewControllers(_ defaultContainer: Container) {
        register(vc: CategoriesViewController.self)
    }

}
