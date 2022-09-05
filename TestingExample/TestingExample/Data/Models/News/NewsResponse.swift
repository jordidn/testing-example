//
//  NewsResponse.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import Foundation

struct NewsResponse: Codable {
    let category: String?
    let data: [NewsDataResponse]?
    let success: Bool?
}

struct NewsDataResponse: Codable {
    let author: String?
    let content: String?
    let date: String?
    let id: String?
    let imageUrl: String?
    let readMoreUrl: String?
    let time: String?
    let title: String?
    let url: String?
}
