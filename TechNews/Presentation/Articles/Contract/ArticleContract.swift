//
//  ArticleContract.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

protocol ArticlePresenter: BasePresenter {
  func load(_ url: String)
}

protocol ArticleView: BaseView {
  func present(article: String)
}
