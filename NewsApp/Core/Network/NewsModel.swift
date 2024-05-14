//
//  NewsModel.swift
//  NewsApp
//
//  Created by mateusdias on 11/05/24.
//

import Foundation


struct NewsModel: Codable {
    let articles: [Articles]
}

struct Articles: Codable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let content: String?
    let urlToImage: String?
    let publishedAt: String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}

