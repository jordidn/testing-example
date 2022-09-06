//
//  Array+SafeRange.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import Foundation

public extension Array {
    
    func element(at index: Int) -> Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }
    
    subscript(safe index: Int) -> Element? {
        return self.element(at: index)
    }
    
}
