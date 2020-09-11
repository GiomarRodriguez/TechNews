//
//  ArticlesContract.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

protocol ArticlesPresenter: BasePresenter {
  func fetchArticles()
  func deleteArticle(_ article: ArticleModel)
  func openArticle(_ article: ArticleModel)
}

protocol ArticlesView: BaseView {
  func present(articles: [ArticleModel])
  func navigateTo(article: ArticleViewController)
}

