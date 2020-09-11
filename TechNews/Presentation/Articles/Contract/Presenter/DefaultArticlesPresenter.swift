//
//  DefaultArticlesPresenter.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

class DefaultArticlesPresenter: ArticlesPresenter {
  
  fileprivate unowned let articleFactory: ArticleFactory
  fileprivate unowned let view: ArticlesView
  fileprivate let getArticlesUseCase: GetArticlesUseCase

  
  init(view: ArticlesView,
       getArticlesUseCase: GetArticlesUseCase,
       articleFactory: ArticleFactory) {
    self.view = view
    self.getArticlesUseCase = getArticlesUseCase
    self.articleFactory = articleFactory
  }
  
  func fetchArticles() {
    getArticlesUseCase.getArticles { [weak self] articles in
      guard let self = self else { return }
      
      self.view.present(articles: articles)
    }
  }
  
  func openArticle(_ article: Article) {
    let parameters: [String: String] = ["url": article.url]
    if let articleViewController = articleFactory.builds(option: .article, with: parameters) as? ArticleViewController {
      view.navigateTo(article: articleViewController)
    }
  }
}
