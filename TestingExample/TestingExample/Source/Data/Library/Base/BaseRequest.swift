//
//  BaseRequest.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import Foundation

enum GenericUrlParametersMode {
    case languageIdAndAppId
    case languageId
    case appId
}

class BaseRequest {
    
    // MARK: - Properties
    
    var languageId: String = "-1"
    var appId: String = "3"
    
    
    // MARK: - Init
    
    init() {}
    
    
    // MARK: - Methods
    
    func getHeaders() -> [String : String]? {
        return nil
    }
    
    func getUrlParameters(with mode: GenericUrlParametersMode) -> [String: Any] {
        var urlParams: [String: Any] = [:]
        switch mode {
        case .languageIdAndAppId:
            urlParams["languageId"] = languageId
            urlParams["appId"] = appId
        case .languageId:
            urlParams["languageId"] = languageId
        case .appId:
            urlParams["appId"] = appId
        }
        return urlParams
    }
    
}
