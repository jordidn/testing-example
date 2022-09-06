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
        defaultContainer.register(NewsPresenter.self) { _ in
            NewsPresenter(getNewsUseCase: SwinjectStoryboard.synchronizedResolver.resolve(GetNewsUseCase.self)!,
                          schedulers: SwinjectStoryboard.synchronizedResolver.resolve(Schedulers.self)!)
        }
    }
    
    override func resolveViewControllers(_ defaultContainer: Container) {
        register(vc: NewsViewController.self)
    }
    
}
