//
//  ArticlesModel.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import Foundation

struct Articles: Decodable {
    let articles: [FeedModel]
}


struct FeedModel: Decodable {
    
    let author: String
    let title: String
    let description: String
    let publishedAt: String
    let urlToImage: String
    
    
    init(author: String, title: String, description: String, publishedAt: String, urlToImage: String) {
        self.author = author
        self.title = title
        self.description = description
        self.publishedAt = publishedAt
        self.urlToImage = urlToImage
    }
    
    func toDictionary() -> [String: Any] {
        return [
            "author": author,
            "title": title,
            "description": description,
            "publishedAt": publishedAt,
            "urlToImage": urlToImage
        ]
    }
}
