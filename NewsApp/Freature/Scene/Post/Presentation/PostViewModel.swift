//
//  PostViewModel.swift
//  NewsApp
//
//  Created by mateusdias on 13/05/24.
//

import Foundation



protocol PostViewModelDelegate: AnyObject  {
    func sendDatas(data: Articles)
}

final class PostViewModel {
    
    var date: String?
    
    weak var delegate: PostViewModelDelegate?
    
    init(delegate: PostViewModelDelegate?) {
        self.delegate = delegate
    }
    
    
    func fetchData(id: Int){
        
        Service.shared.Request(urlPath: UrlPaths.EndPoint,
                               type: NewsModel.self,
                               callback: { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    let detail = data.articles[id]
                    self?.delegate?.sendDatas(data: detail)
                case let .failure(error):
                    print(error)
                }
            }
            
        })
    }
}
