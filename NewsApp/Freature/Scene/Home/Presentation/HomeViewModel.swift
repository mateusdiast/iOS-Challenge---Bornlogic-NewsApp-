//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by mateusdias on 11/05/24.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject  {
    func sendDatas(data: [Articles])
}

final class HomeViewModel {
    
    weak var delegate: HomeViewModelDelegate?
    
    init(delegates: HomeViewModelDelegate?) {
        self.delegate = delegates
    }
    
    
    func fetchData(){
        
        Service.shared.Request(urlPath: UrlPaths.EndPoint,
                               type: NewsModel.self,
                               callback: { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    self?.delegate?.sendDatas(data: data.articles)
                case let .failure(error):
                    print(error)
                }
            }
            
        })
    }
    
}
