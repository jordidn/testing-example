//
//  GetNewsUseCase.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import RxSwift

class GetNewsUseCase: UseCase {
    
    // MARK: - Typealias
    
    typealias Params = GetNewsUseCaseParams
    typealias Response = Single<[NewsEntity]>
    
    
    // MARK: - Dependencies
    
    private let newsRepository: NewsRepository
    
    
    // MARK: - Init
    
    init(newsRepository: NewsRepository) {
        self.newsRepository = newsRepository
    }
    
    
    // MARK: - Implementation
    
    func execute(with params: GetNewsUseCaseParams) -> Single<[NewsEntity]> {
        return newsRepository.getNews(for: params.category)
    }
    
}


// MARK: - Params

struct GetNewsUseCaseParams {
    let category: String
}
