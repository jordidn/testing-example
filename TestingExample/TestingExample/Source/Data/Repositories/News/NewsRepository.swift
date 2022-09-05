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
    
    private let newsFactory: NewsFactory
    private let genericApiProvider: GenericApiProvider
    
    
    // MARK: - Init
    
    init(newsFactory: NewsFactory, genericApiProvider: GenericApiProvider, localProvider: LocalProvider) {
        self.newsFactory = newsFactory
        self.genericApiProvider = genericApiProvider
        super.init(localProvider: localProvider)
    }
    
    
    // MARK: - Implementation
    
    func getCategories() -> Single<[String]> {
        let categories = localProvider.getCategories()
        return .just(categories)
    }
    
    func getNews(for category: String) -> Single<[NewsEntity]> {
        let request = NewsRequest(category: category)
        
        return genericApiProvider.request(NewsTarget.getNews(request: request))
            .map(NewsResponse.self)
            .flatMap { [weak self] response in
                guard let self = self else { return .error(CustomError.mapping) }
                let news = self.newsFactory.getNews(from: response)
                return .just(news)
            }
    }
    
}
