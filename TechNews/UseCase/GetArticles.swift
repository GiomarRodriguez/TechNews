//
//  GetArticles.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

import Foundation

protocol GetArticlesUseCase {
  func getArticles(completion: @escaping ([ArticleModel]) -> Void)
}

class DefaultGetArticlesUseCase: GetArticlesUseCase {
  
  var articles: ArticleRepository
  
  init(articles: ArticleRepository) {
    self.articles = articles
  }
  
  func getArticles(completion: @escaping ([ArticleModel]) -> Void) {
    
    articles.all {[weak self] result in
      guard let self = self else { return }
      
      switch result {
        case .success(let articles) :
          completion(self.filterArticles(articles, with: self.articles.deletedIds()))
          self.articles.save(articles: articles)
        
        case .failure(_):
          let articleStored = self.articles.stored()
          completion(self.filterArticles(articleStored, with: self.articles.deletedIds()))
      }
    }
  }
  
  private func filterArticles(_ articles: [Article], with ids: [String]) -> [ArticleModel] {
    
    let idsDictionary = ids.map { [$0: $0] }
    
    let articlesFiltered = articles.filter {
      !$0.title.isEmpty && !$0.url.isEmpty && !idsDictionary.contains([$0.id: $0.id])
    }.map { (article) -> ArticleModel in
      return ArticleModel(id: article.id, title: article.title, description: article.author + " - " + self.makeLongAgo(from: article.created), url: article.url)
    }
    
    return articlesFiltered
  }
  
  private func makeLongAgo(from created: String) -> String {
    let formater = ISO8601DateFormatter()
    formater.formatOptions = [.withFullDate,
                              .withTime,
                              .withDashSeparatorInDate,
                              .withColonSeparatorInTime]
    let date = formater.date(from: created)!
    
    let formatter = RelativeDateTimeFormatter()
    formatter.unitsStyle = .full
    let string = formatter.localizedString(for: date, relativeTo: Date())
    return string
  }
}

