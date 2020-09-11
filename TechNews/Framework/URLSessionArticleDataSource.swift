//
//  ArticleLocalDataSource.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

import Foundation

class URLSessionArticleDataSource: ArticleRemoteDataSource {
  
  func readAll(completion: @escaping ([Article]) -> Void) {
    guard let articlesUrl = URL(string:"https:hn.algolia.com/api/v1/search_by_date?query=ios") else {
      print("invalid URL")
      
      completion([])
      return
    }
    
    let task = URLSession.shared.dataTask(with: articlesUrl) { (data, response, error) in
      if error == nil {
        
      }
      
      guard let data = data else { return }
      
      
      let decoder = JSONDecoder()
      
      do {
        let articleDataStore = try decoder.decode(ArticleDataStore.self, from: data)
        completion(articleDataStore.hits)
        
      } catch {
        print(error)
      }
    }
    task.resume()
  }
}
