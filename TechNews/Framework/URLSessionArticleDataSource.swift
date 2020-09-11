//
//  ArticleLocalDataSource.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

import Foundation

class URLSessionArticleDataSource: ArticleRemoteDataSource {
  
  private var configuration: Configuration
  
  init(configuration: Configuration) {
    self.configuration = configuration
  }
  
  func readAll(completion: @escaping (Result<[Article]>) -> Void) {

    var urlComponents = URLComponents.init()
    urlComponents.scheme = configuration.scheme()
    urlComponents.host = configuration.host()
    urlComponents.path = configuration.path(type: .search)
    urlComponents.queryItems = [URLQueryItem.init(name: "query", value: "ios")]
    
    let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
      if error == nil {
        completion(.failure(RequestError.badResponse))
      }
      
      guard let data = data else {
        completion(.failure(RequestError.withOutData))
        return
      }
      
      let decoder = JSONDecoder()
      do {
        let articleDataStore = try decoder.decode(ArticleDataStore.self, from: data)
        completion(.success(articleDataStore.hits))
        
      } catch {
        print(error)
        completion(.failure(RequestError.parseError))
      }
    }
    task.resume()
  }
}

enum RequestError : Error {
  case badResponse
  case withOutData
  case parseError
}
