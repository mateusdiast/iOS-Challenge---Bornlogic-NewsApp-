//
//  PostView.swift
//  NewsApp
//
//  Created by mateusdias on 12/05/24.
//

import UIKit

protocol PostViewDelegate: AnyObject {
    func getData()
}

final class PostView: UIView {
    
    weak var delegate: PostViewDelegate?
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.contentInsetAdjustmentBehavior = .never
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageNews: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var dataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        delegate?.getData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDatas(data: Articles){
        dataLabel.text = data.publishedAt?.toLocalDateString()
        descriptionLabel.text = data.content
        imageNews.downloaded(from: data.urlToImage ?? "")
    }
    
}


extension PostView: ViewConfig {
    
    func buildViews() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(imageNews)
        containerView.addSubview(dataLabel)
        containerView.addSubview(descriptionLabel)
    }
    
    func pin() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageNews.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageNews.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageNews.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageNews.heightAnchor.constraint(equalToConstant: 300),
            
            dataLabel.topAnchor.constraint(equalTo: imageNews.bottomAnchor, constant: 15),
            dataLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            dataLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            
            descriptionLabel.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15)
            
        ])
        
    
    }
    
    func extraSetup() {
        backgroundColor = .systemBackground
    }
    
}
