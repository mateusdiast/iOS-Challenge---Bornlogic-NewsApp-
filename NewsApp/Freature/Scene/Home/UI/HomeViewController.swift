//
//  ViewController.swift
//  NewsApp
//
//  Created by mateusdias on 11/05/24.
//

import UIKit

final class HomeViewController: UIViewController {

    lazy var viewModel: HomeViewModel = {
        let homeViewModel = HomeViewModel(delegates: self)
        return homeViewModel
    }()
    
    lazy var homeView: HomeView = {
       let view = HomeView(delegate: self)
       return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavBar()
        viewModel.fetchData()
    }
    
    func setupNavBar(){
        navigationItem.title = "NewsApp"
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

extension HomeViewController: HomeViewModelDelegate {
    func sendDatas(data: [Articles]) {
        homeView.setData(data: data)
    }
}


extension HomeViewController: HomeViewDelegate {
    
    func selectedNews(id: Int) {
        let vc = PostViewController(id: id)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
