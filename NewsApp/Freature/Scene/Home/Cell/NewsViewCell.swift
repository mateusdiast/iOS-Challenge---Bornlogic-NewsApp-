//
//  NewsViewCell.swift
//  NewsApp
//
//  Created by mateusdias on 11/05/24.
//

import UIKit

final class NewsViewCell: UITableViewCell {
    
    static var identifier: String {String(describing: self)}
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerDescription: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "containerDescription")
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleNews: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "mainColor")
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var imageNews: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var autor: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setData(title: String, author: String, description: String, urlimage: String) {
        titleNews.text = title
        autor.text = "Author: \(author)"
        descriptionLabel.text = description
        imageNews.downloaded(from: urlimage)
        
    }
    
}

extension NewsViewCell: ViewConfig {
    func buildViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(titleNews)
        containerView.addSubview(containerDescription)
        containerDescription.addSubview(imageNews)
        containerDescription.addSubview(autor)
        containerDescription.addSubview(descriptionLabel)
    }
    
    func pin() {
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleNews.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            titleNews.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            titleNews.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            
            imageNews.topAnchor.constraint(equalTo: titleNews.bottomAnchor, constant: 10),
            imageNews.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            imageNews.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            imageNews.heightAnchor.constraint(equalToConstant: 200),
            
            containerDescription.topAnchor.constraint(equalTo: imageNews.topAnchor),
            containerDescription.leadingAnchor.constraint(equalTo: imageNews.leadingAnchor),
            containerDescription.trailingAnchor.constraint(equalTo: imageNews.trailingAnchor),
            containerDescription.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15),
            
            autor.topAnchor.constraint(equalTo: imageNews.bottomAnchor, constant: 15),
            autor.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            autor.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            
            
            descriptionLabel.topAnchor.constraint(equalTo: autor.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerDescription.leadingAnchor, constant: 12),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerDescription.trailingAnchor, constant: -12),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerDescription.bottomAnchor, constant: -15),
            
            
        ])
    }
    
    func extraSetup() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    
}
