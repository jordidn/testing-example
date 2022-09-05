//
//  NewsRepository.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import RxSwift
import Moya

protocol NewsRepository {
    func getCategories() -> Single<[String]>
    func getNews(for category: String) -> Single<[NewsEntity]>
}

class NewsDataRepository: BaseDataRepository, NewsRepository {
    
    // MARK: - Dependencies
    
    private let apiProvider: GenericApiProvider
    private let newsFactory: NewsFactory
    
    
    // MARK: - Init
    
    init(apiProvider: GenericApiProvider, newsFactory: NewsFactory, localProvider: LocalProvider) {
        self.apiProvider = apiProvider
        self.newsFactory = newsFactory
        super.init(localProvider: localProvider)
    }
    
    
    // MARK: - Implementation
    
    func getCategories() -> Single<[String]> {
        let categories = localProvider.getCategories()
        return .just(categories)
    }
    
    func getNews(for category: String) -> Single<[NewsEntity]> {
        let request = NewsRequest(category: category)
        
        return apiProvider.request(NewsTarget.getNews(request: request))
            .map(NewsResponse.self)
            .flatMap { [weak self] response in
                guard let self = self else { return .error(CustomError.mapping) }
                let news = self.newsFactory.getNews(from: response)
                return .just(news)
            }
    }
    
}
