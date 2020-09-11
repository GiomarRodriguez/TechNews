//
//  GetArticles.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

protocol GetArticlesUseCase {
  func getArticles(completion: @escaping ([Article]) -> Void)
}

class DefaultGetArticlesUseCase: GetArticlesUseCase {
  
  var articles: ArticleRepository
  
  init(articles: ArticleRepository) {
    self.articles = articles
  }
  
  func getArticles(completion: @escaping ([Article]) -> Void) {
    
    articles.all { articles in
  
      completion(articles)
    }
  }
}


