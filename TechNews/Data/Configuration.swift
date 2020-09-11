//
//  Configuration.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/11/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

protocol Configuration {
  func scheme() -> String
  func host() -> String
  func path(type: PathType) -> String
}

enum PathType {
  case search
}
