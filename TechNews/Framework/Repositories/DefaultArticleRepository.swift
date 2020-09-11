//
//  DefaultArticleRepository.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

class DefaultArticleRepository: ArticleRepository {
  
  var remote: ArticleRemoteDataSource
  var local: ArticleLocalDataSource
  
  init(remote: ArticleRemoteDataSource,
       local: ArticleLocalDataSource) {
    self.remote = remote
    self.local = local
  }
  
  func all(completion: @escaping (Result<[Article]>) -> Void) {
    remote.readAll { result in
      
      completion(result)
    }
  }
  
  func stored() -> [Article] {
    return local.readAll()
  }
  
  func save(articles: [Article]) {
    local.write(articles: articles)
  }
  
  func delete(articleId: String) {
    local.delete(with: articleId)
  }
  
  func deletedIds() -> [String] {
    local.readDeletedIds()
  }
}
