//
//  TechNewsConfiguration.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/11/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

class TechNewsConfiguration: Configuration {
  
  func scheme() -> String {
    return "https"
  }
  
  func host() -> String {
    return "hn.algolia.com"
  }
  
  func path(type: PathType) -> String {
    switch type {
      case .search:
      return "/api/v1/search_by_date"
    }
  }
}
