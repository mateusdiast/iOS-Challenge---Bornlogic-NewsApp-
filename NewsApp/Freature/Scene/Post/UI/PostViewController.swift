//
//  PostViewController.swift
//  NewsApp
//
//  Created by mateusdias on 12/05/24.
//

import UIKit

class PostViewController: UIViewController {
    
    var id: Int
    
    private lazy var postView: PostView = {
        let view = PostView()
        return view
    }()
    
    private lazy var postViewModel: PostViewModel = {
        let postViewModel = PostViewModel(delegate: self)
        return postViewModel
    }()

    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func loadView() {
        view = postView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavBar()
        postViewModel.fetchData(id: id)
    }
    
    func setUpNavBar(){
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = UIColor.clear
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.tintColor = .main
        tabBarController?.navigationItem.backButtonTitle = ""
    }
}

extension PostViewController: PostViewModelDelegate {
    func sendDatas(data: Articles) {
        postView.setDatas(data: data)
    }
    
    
}
