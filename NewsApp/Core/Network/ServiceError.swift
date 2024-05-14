//
//  ServiceError.swift
//  NewsApp
//
//  Created by mateusdias on 11/05/24.
//

import Foundation

enum ServiceError: Error {
    case invalidURL
    case decodeFail(Error)
    case network(Error?)
}
