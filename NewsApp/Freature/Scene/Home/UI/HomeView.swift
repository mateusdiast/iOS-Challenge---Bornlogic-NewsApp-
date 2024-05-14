//
//  HomeView.swift
//  NewsApp
//
//  Created by mateusdias on 11/05/24.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func selectedNews(id: Int)
}

final class HomeView: UIView {
    
    private var data: [Articles]?

    weak var delegate: HomeViewDelegate?
    
    private lazy var contentTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewsViewCell.self, forCellReuseIdentifier: NewsViewCell.identifier)
        return tableView
    }()
    
    init(delegate: HomeViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setData(data: [Articles]) {
        self.data = data
        contentTableView.reloadData()
    }
}

extension HomeView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedNews(id: indexPath.row)
    }
    
}

extension HomeView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let datacount = self.data else { return 0 }
        return datacount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsViewCell.identifier) as? NewsViewCell else {
            return UITableViewCell()
        }
        
        
        
        if let dataUwrapped = data {
            
            cell.setData(title: dataUwrapped[indexPath.row].title ?? "Without Title",
                         author: dataUwrapped[indexPath.row].author ?? "unknown",
                         description: dataUwrapped[indexPath.row].description ?? "" ,
                         urlimage: dataUwrapped[indexPath.row].urlToImage ?? "")
            
        }
        
        return cell
        
    }
}

extension HomeView: ViewConfig {
    func buildViews() {
        addSubview(contentTableView)
    }
    
    func pin() {
        NSLayoutConstraint.activate([
            contentTableView.topAnchor.constraint(equalTo: topAnchor),
            contentTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func extraSetup() {
        backgroundColor = .systemBackground
    }
    
    
}
