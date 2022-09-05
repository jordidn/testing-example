//
//  NewsDataModule.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import Swinject
import SwinjectStoryboard

public class NewsDataModule: BaseDataModule {
    
    override func resolveUseCases(_ defaultContainer: Container) {
        defaultContainer.register(GetCategoriesUseCase.self) { r in
            GetCategoriesUseCase(newsRepository: SwinjectStoryboard.synchronizedResolver.resolve(NewsRepository.self)!)
        }
        
        defaultContainer.register(GetNewsUseCase.self) { r in
            GetNewsUseCase(newsRepository: SwinjectStoryboard.synchronizedResolver.resolve(NewsRepository.self)!)
        }
    }
    
    override func resolveRepositories(_ defaultContainer: Container) {
        defaultContainer.register(NewsRepository.self) { _ in
            NewsDataRepository(newsFactory: SwinjectStoryboard.synchronizedResolver.resolve(NewsFactory.self)!,
                               genericApiProvider: SwinjectStoryboard.synchronizedResolver.resolve(GenericApiProvider.self)!,
                               localProvider: SwinjectStoryboard.synchronizedResolver.resolve(LocalProvider.self)!)
        }
    }
    
    override func resolveFactories(_ defaultContainer: Container) {
        defaultContainer.register(NewsFactory.self) { _ in
            NewsFactory()
        }
    }
    
}
