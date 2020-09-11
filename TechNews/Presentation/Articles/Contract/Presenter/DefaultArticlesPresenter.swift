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
  fileprivate let deleteArticleUseCase: DeleteArticlesUseCase
  fileprivate let getArticlesUseCase: GetArticlesUseCase

  
  init(view: ArticlesView,
       getArticlesUseCase: GetArticlesUseCase,
       deleteArticleUseCase: DeleteArticlesUseCase,
       articleFactory: ArticleFactory) {
    self.view = view
    self.getArticlesUseCase = getArticlesUseCase
    self.articleFactory = articleFactory
    self.deleteArticleUseCase = deleteArticleUseCase
  }
  
  func fetchArticles() {
    getArticlesUseCase.getArticles { [weak self] articles in
      guard let self = self else { return }
      
      self.view.present(articles: articles)
    }
  }
  
  func deleteArticle(_ article: ArticleModel) {
    deleteArticleUseCase.deleteArticle(article)
  }
  
  func openArticle(_ article: ArticleModel) {
    let parameters: [String: String] = ["url": article.url]
    if let articleViewController = articleFactory.builds(option: .article, with: parameters) as? ArticleViewController {
      view.navigateTo(article: articleViewController)
    }
  }
}
