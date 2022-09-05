//
//  GetCategoriesUseCase.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import RxSwift

class GetCategoriesUseCase: UseCase {
    
    // MARK: - Typealias
    
    typealias Params = Void
    typealias Response = Single<[String]>
    
    
    // MARK: - Dependencies
    
    private let newsRepository: NewsRepository
    
    
    // MARK: - Init
    
    init(newsRepository: NewsRepository) {
        self.newsRepository = newsRepository
    }
    
    
    // MARK: - Implementation
    
    func execute(with params: Void) -> Single<[String]> {
        return newsRepository.getCategories()
    }
    
}
