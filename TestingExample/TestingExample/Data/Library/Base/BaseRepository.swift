//
//  BaseRepository.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import Foundation

protocol BaseRepository {
    func fillBaseRequest<P>(_ baseRequest: P) -> P where P: BaseRequest
}

class BaseDataRepository: BaseRepository {
    
    internal let localProvider: LocalProvider

    init(localProvider: LocalProvider) {
        self.localProvider = localProvider
    }
    
    func fillBaseRequest<P>(_ baseRequest: P) -> P where P: BaseRequest {
        if let languageId = localProvider.getLanguageId() {
            baseRequest.languageId = String(languageId)
        }
        return baseRequest
    }
}
