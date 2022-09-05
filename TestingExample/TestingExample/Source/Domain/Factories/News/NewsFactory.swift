//
//  NewsFactory.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import Foundation

class NewsFactory {

    // MARK: - Public methods
    
    func getNews(from response: NewsResponse) -> [NewsEntity] {
        guard let data = response.data else { return [] }
        
        return data.compactMap { mapNewsItem(from: $0) }
    }

    
    // MARK: - private methods
    
    private func mapNewsItem(from response: NewsDataResponse) -> NewsEntity? {
        guard let id = response.id,
              let author = response.author,
              let title = response.title,
              let description = response.content,
              let imageUrl = response.imageUrl,
              let date = response.date,
              let readMoreUrl = response.readMoreUrl else {
                  return nil
              }
        return NewsEntity(id: id, author: author, title: title, description: description, imageUrl: imageUrl, date: date, readMoreUrl: readMoreUrl)
    }
    
}
