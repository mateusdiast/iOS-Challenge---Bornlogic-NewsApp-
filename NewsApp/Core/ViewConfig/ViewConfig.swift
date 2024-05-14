//
//  ViewConfig.swift
//  NewsApp
//
//  Created by mateusdias on 11/05/24.
//

import Foundation

protocol ViewConfig {
    func buildViews()
    func pin()
    func extraSetup()
    func setup()
}

extension ViewConfig {
    func setup(){
        buildViews()
        pin()
        extraSetup()
    }
}
