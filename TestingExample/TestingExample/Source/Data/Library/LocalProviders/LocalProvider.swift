//
//  LocalProvider.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import Foundation

protocol LocalProvider {
    func getLanguageId() -> Int?
    func save(languageId: Int)
    
    func getCategories() -> [String]
    
    func removePersistence()
}

public class LocalDataProvider: LocalProvider {
    
    // MARK: - Properties
    
    private var languageId: Int? {
        didSet {
            UserDefaults.standard.languageId = languageId
        }
    }
    
    
    // MARK: - Init
    
    init() {
        languageId = self.getLanguageId()
    }
    
    
    // MARK: - Implementation
    
    func removePersistence() {
        deleteLanguageId()
    }
    
    
    // MARK: - LanguageId
    
    func save(languageId: Int) {
        self.languageId = languageId
    }
    
    func getLanguageId() -> Int? {
        guard let languageId = languageId else {
            return UserDefaults.standard.languageId
        }
        return languageId
    }
    
    private func deleteLanguageId() {
        self.languageId = nil
    }
    
    
    // MARK: - Categories
    
    func getCategories() -> [String] {
        let categories = [
            "all",
            "national", //Indian News only
            "business",
            "sports",
            "world",
            "politics",
            "technology",
            "startup",
            "entertainment",
            "miscellaneous",
            "hatke",
            "science",
            "automobile"
        ]
        return categories
    }
    
}
