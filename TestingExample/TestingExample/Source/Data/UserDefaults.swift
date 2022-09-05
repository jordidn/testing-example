//
//  UserDefaults.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import Foundation

extension UserDefaults {
    
    // MARK: - Keys
    
    private enum Keys {
        static let languageId = "store_language_id"
    }
    
    
    // MARK: - Properties
    
    var languageId: Int? {
        set {
            set(newValue, forKey: Keys.languageId)
        }
        get {
            object(forKey: Keys.languageId) as? Int
        }
    }
    
}
