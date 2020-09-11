//
//  DeleteArticle.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/11/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

protocol DeleteArticlesUseCase {
  func deleteArticle(_ article: ArticleModel)
}

class DefaultDeleteArticlesUseCase: DeleteArticlesUseCase {
  
  var articles: ArticleRepository
  
  init(articles: ArticleRepository) {
    self.articles = articles
  }

  func deleteArticle(_ article: ArticleModel) {
    articles.delete(articleId: article.id)
  }
}
