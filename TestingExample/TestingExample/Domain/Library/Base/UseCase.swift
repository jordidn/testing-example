//
//  UseCase.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import Foundation

protocol UseCase {
    associatedtype Params: Any
    associatedtype Response: Any
    func execute(with params: Params) -> Response
}

extension UseCase where Params == Void {
    func execute() -> Response {
        return execute(with: Void())
    }
}
