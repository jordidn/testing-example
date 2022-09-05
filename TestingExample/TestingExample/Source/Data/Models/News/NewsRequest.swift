//
//  NewsRequest.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import Foundation

class NewsRequest: BaseRequest {
    
    // MARK: - Properties
    
    var category: String
    
    
    // MARK: - Init
    
    init(category: String) {
        self.category = category
    }
    
    
    // MARK: - Override methods
    
    override func getUrlParameters(with mode: GenericUrlParametersMode) -> [String : Any] {
        var params = super.getUrlParameters(with: mode)
        params["category"] = category
        return params
    }
    
}
