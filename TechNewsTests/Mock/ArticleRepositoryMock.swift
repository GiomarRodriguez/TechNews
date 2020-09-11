//
//  ArticleRepositoryMock.swift
//  TechNewsTests
//
//  Created by Giomar Rodriguez on 9/11/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

@testable import TechNews

class ArticleRepositoryMock: ArticleRepository {
  
  var articles: [Article] = []
  var ids: [String] = []
  
  init(articles: [Article], ids: [String]) {
    self.articles = articles
    self.ids = ids
  }
  
  func all(completion: @escaping ([Article]) -> Void) {
    completion(articles)
  }
  
  func stored() -> [Article] {
    return articles
  }
  
  func save(articles: [Article]) {
    self.articles = articles
  }
  
  func delete(article: Article) {
    ids.append(article.id)
  }
  
  func deletedIds() -> [String] {
    ids
  }
}
