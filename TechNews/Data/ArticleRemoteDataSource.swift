//
//  ArticleDataSource.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

import Foundation

protocol ArticleRemoteDataSource: class {
  func readAll(completion: @escaping (Result<[Article]>)-> Void)
}
