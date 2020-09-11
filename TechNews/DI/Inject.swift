//
//  Inject.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

class Inject {
  
  static let shared = Inject()
  
  var container: Container = {
    let container = Container()
    return container
  }()
  
  func makePresenter(option: ArticleOption, view: BaseView) throws -> BasePresenter {
    switch option {
      case .articles:
        if let articlesView = view as? ArticlesView {
          articleComponents()
          factoryComponents()
          return DefaultArticlesPresenter(view: articlesView,
                                          getArticlesUseCase: container.resolve(GetArticlesUseCase.self)!,
                                          deleteArticleUseCase: container.resolve(DeleteArticlesUseCase.self)!,
                                          articleFactory: container.resolve(ArticleFactory.self)!)
        }
      case .article:
        if let articleView = view as? ArticleView {
          articleComponents()
          return DefaultArticlePresenter(view: articleView)
      }
    }
    throw DefaultError.noneCase
  }
  
  public func makeArticleFactory() -> ArticleFactory {
    factoryComponents()
    return container.resolve(ArticleFactory.self)!
  }
  
  private func factoryComponents() {
    container.autoregister(ArticleFactory.self, initializer: DefaultArticleFactory.init).inObjectScope(.container)
  }
  
  private func articleComponents() {
    container.autoregister(Configuration.self, initializer: TechNewsConfiguration.init).inObjectScope(.container)
    container.autoregister(ArticleLocalDataSource.self, initializer: UserDefaultArticleDataSource.init).inObjectScope(.container)
    container.autoregister(ArticleRemoteDataSource.self, initializer: URLSessionArticleDataSource.init).inObjectScope(.container)
    container.autoregister(ArticleRepository.self, initializer: DefaultArticleRepository.init).inObjectScope(.container)
    container.autoregister(GetArticlesUseCase.self, initializer: DefaultGetArticlesUseCase.init).inObjectScope(.container)
    container.autoregister(DeleteArticlesUseCase.self, initializer: DefaultDeleteArticlesUseCase.init).inObjectScope(.container)
  }
}

enum DefaultError: Error {
  case noneCase
}
