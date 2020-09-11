//
//  ArticleLocalDataSource.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//


protocol ArticleLocalDataSource: class {
  func readAll() -> [Article]
  func write(articles: [Article])
  func readDeletedIds() -> [String]
  func delete(with id: String)
}
