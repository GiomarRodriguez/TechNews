//
//  File.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

struct Article {
  var id: String
  var title: String = ""
  var author: String
  var created: String
  var url: String = ""
}

extension Article: Codable {
  enum CodingKeys: String, CodingKey {
    case id = "objectID"
    case title
    case author
    case created = "created_at"
    case url
  }
  
  enum StoryKeys: String, CodingKey {
    case storyTitle = "story_title"
    case storyUrl = "story_url"
  }
  
  init(from decoder: Decoder) throws {
    let articleValues = try decoder.container(keyedBy: CodingKeys.self)
    let storyValues = try decoder.container(keyedBy: StoryKeys.self)
    
    id = try articleValues.decode(String.self, forKey: .id)
    author = try articleValues.decode(String.self, forKey: .author)
    created = try articleValues.decode(String.self, forKey: .created)

    title = try decodeValue(keyContainer: articleValues, key: .title)
    if title == "" {
      title = try decodeValue(keyContainer: storyValues, key: .storyTitle)
    }
    
    url = try decodeValue(keyContainer: articleValues, key: .url)
    if url == "" {
      url = try decodeValue(keyContainer: storyValues, key: .storyUrl)
    }
  }
  
  private func decodeValue<Element>(keyContainer: KeyedDecodingContainer<Element>, key: Element) throws -> String {
    if !keyContainer.contains(key) {
      return ""
    }
    
    if try keyContainer.decodeNil(forKey: key) {
      return ""
    }
    
    return try keyContainer.decode(String.self, forKey: key)
  }
}

struct ArticleDataStore: Codable {
  var hits: [Article]
}
