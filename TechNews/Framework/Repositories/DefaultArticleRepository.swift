//
//  DefaultArticleRepository.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

class DefaultArticleRepository: ArticleRepository {
  
  unowned let remote: ArticleRemoteDataSource
  unowned let local: ArticleLocalDataSource
  
  init(remote: ArticleRemoteDataSource,
       local: ArticleLocalDataSource) {
    self.remote = remote
    self.local = local
  }
  
  func all(completion: @escaping ([Article]) -> Void) {
    remote.readAll { articles in
      
      completion(articles)
    }
  }
  
  func stored() -> [Article] {
    return local.readAll()
  }
  
  func save(articles: [Article]) {
    local.write(articles: articles)
  }
  
  func delete(article: Article) {
    local.delete(with: article.id)
  }
  
  func deletedIds() -> [String] {
    local.readDeletedIds()
  }
}
