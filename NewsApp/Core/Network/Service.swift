//
//  Service.swift
//  NewsApp
//
//  Created by mateusdias on 11/05/24.
//

import Foundation


protocol ServiceInput {
    static var shared: Self { get set }
    func Request<T: Decodable>(urlPath: String, type: T.Type, callback: @escaping (Result<T, ServiceError>) -> Void)
}

final class Service: ServiceInput {
    
    static var shared: Service = Service()
    
    func Request<T: Decodable>(urlPath: String, type: T.Type, callback: @escaping (Result<T, ServiceError>) -> Void) {
        
        guard let url = URL(string: urlPath) else {
            callback(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            guard let data = data else {
                callback(.failure(.network(error)))
                return
            }
            
            do {
                let data = try JSONDecoder().decode(T.self, from: data)
                callback(.success(data))
            } catch {
                callback(.failure(.decodeFail(error)))
            }
            
        })
        task.resume()
    }
    
    private init(){}
    
}
