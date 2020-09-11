//
//  ArticlesRepository.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

protocol ArticleRepository {
  
  func all(completion: @escaping (Result<[Article]>) -> Void)
  func stored() -> [Article]
  func save(articles: [Article])
  func delete(articleId: String)
  func deletedIds() -> [String]
}
