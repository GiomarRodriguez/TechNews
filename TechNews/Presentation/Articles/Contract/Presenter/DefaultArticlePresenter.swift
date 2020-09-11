//
//  DefaultArticlePresenter.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

class DefaultArticlePresenter: ArticlePresenter {

  fileprivate unowned let view: ArticleView

  
  init(view: ArticleView) {
    self.view = view
  }

  func load(_ url: String) {
    view.present(article: url)
  }
}

