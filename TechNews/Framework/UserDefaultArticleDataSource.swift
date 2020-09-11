//
//  UserDefaultArticleDataSource.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

import Foundation

class UserDefaultArticleDataSource: ArticleLocalDataSource {
  
  fileprivate let userDefaults: UserDefaults
  fileprivate let extensionGroup = "group.spartan.team.TechNews"
  
  fileprivate let articlesKey = "articles"
  fileprivate let articlesDeletedKey = "articles_deleted"
  
  init() {
    userDefaults = .standard
  }
  
  func readAll() -> [Article] {
    guard let data = userDefaults.value(forKey: articlesKey) as? Data else { return [] }
  
    guard let articles = try? JSONDecoder().decode([Article].self, from: data) else { return [] }
    
    return articles
    
  }
  
  func write(articles: [Article]) {
    guard let data = try? JSONEncoder().encode(articles) else { return }
   
    userDefaults.set(data, forKey: articlesKey)
  }
  
  func readDeletedIds() -> [String] {
    guard let articleDeleted = userDefaults.value(forKey: articlesDeletedKey) as? [String] else {
      let initValue: [String] = []
      userDefaults.set(initValue, forKey: articlesDeletedKey)
      return []
    }
    
    return articleDeleted
  }
  
  func delete(with id: String) {
    guard var articleDeleted = userDefaults.value(forKey: articlesDeletedKey) as? [String] else { return }
    articleDeleted.append(id)
    
    userDefaults.set(articleDeleted, forKey: articlesDeletedKey)
  }
}
