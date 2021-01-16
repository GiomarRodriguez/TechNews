//
//  GetArticlesSpec.swift
//  TechNewsTests
//
//  Created by Giomar Rodriguez on 9/11/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

import Nimble
import Quick

@testable import TechNews
class GetArticlesSpec: QuickSpec {
    
    override func spec() {
        describe("Get Articles") {
            var articles: ArticleRepository!
            var getArticles: DefaultGetArticlesUseCase!
            
            context("when there isn't articles deleted") {
                articles = ArticleRepositoryMock(articles: articlesRemote(), ids: [])
                getArticles = DefaultGetArticlesUseCase(articles: articles)
                getArticles.getArticles { articles in
                    
                    it("should show just article with title and url") {
                        
                        expect(articles.count).to(equal(4))
                    }
                }
            }
            
            context("when there are two articles deleted") {
                articles = ArticleRepositoryMock(articles: articlesRemote(), ids: articlesDeletedIds())
                getArticles = DefaultGetArticlesUseCase(articles: articles)
                getArticles.getArticles { articles in
                    
                    it("should show just article with title and url and not deleted") {
                        
                        expect(articles.count).to(equal(2))
                    }
                }
                
            }
        }
    }
}

extension GetArticlesSpec {
    
    private func articlesRemote() -> [Article] {
        var articles: [Article] = []
        articles.append(
            Article(id: "123", title: "You know", author: "Yoko", created: "2021-01-16T02:46:17.000Z", url: "www.google.com")
        )
        articles.append(
            Article(id: "124", title: "", author: "Mendez", created: "2021-01-16T02:46:50.000Z", url: "")
        )
        articles.append(
            Article(id: "125", title: "Xcode now", author: "apple", created: "2021-01-16T02:49:17.000Z", url: "")
        )
        articles.append(
            Article(id: "126", title: "Xperience windows", author: "microsoft", created: "2021-01-16T02:48:17.000Z", url: "www.google.com")
        )
        articles.append(
            Article(id: "127", title: "Tesla revolution", author: "mapis", created: "2021-01-16T02:50:17.000Z", url: "www.google.com")
        )
        articles.append(
            Article(id: "128", title: "Amazon Today", author: "necos", created: "2021-01-16T02:53:17.000Z", url: "www.google.com")
        )
        
        return articles
    }
    
    private func articlesDeletedIds() -> [String] {
        var ids: [String] = []
        ids.append("123")
        ids.append("128")
        
        return ids
    }
}
