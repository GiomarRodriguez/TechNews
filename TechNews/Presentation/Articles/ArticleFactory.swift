//
//  Router.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

import UIKit

protocol ArticleFactory: class {
  func builds(option: ArticleOption, with parameters: [String: String]) -> UIViewController
}

class DefaultArticleFactory: ArticleFactory {
  func builds(option: ArticleOption, with parameters: [String: String]) -> UIViewController {
    
    switch option {
      case .articles:
        let articlesViewController = ArticlesViewController()
        do {
          if let presenter = try Inject.shared.makePresenter(option: .articles,
                                                             view: articlesViewController) as? ArticlesPresenter {
            articlesViewController.presenter = presenter
          }
        } catch {}
        
        return articlesViewController
      
      case .article:
        let articleViewController = ArticleViewController()
        do {
          if let presenter = try Inject.shared.makePresenter(option: .article,
                                                             view: articleViewController) as? ArticlePresenter {
            
            if let url = parameters["url"] {
              articleViewController.url = url
            }
            articleViewController.presenter = presenter
          }
        } catch { }
        
        return articleViewController
    }
  }
}

enum ArticleOption {
  case articles
  case article
}
