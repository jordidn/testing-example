//
//  NewsTarget.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import Foundation
import Moya

enum NewsTarget {
    case getNews(request: NewsRequest)
}

extension NewsTarget: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://inshorts.deta.dev/")!
    }
    
    var path: String {
        switch self {
        case .getNews:
            return "news"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getNews:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getNews(let request):
            let params = request.getUrlParameters(with: .appId)
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getNews(let request):
            return request.getHeaders()
        }
    }
    
}
