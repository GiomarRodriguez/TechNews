//
//  ArticlesContract.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

protocol ArticlesPresenter: BasePresenter {
  func fetchArticles()
  func openArticle(_ article: Article)
}

protocol ArticlesView: BaseView {
  func present(articles: [Article])
  func navigateTo(article: ArticleViewController)
}

