//
//  ArticlesModel.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import Foundation
import RxSwift
import RxCocoa

struct Articles: Codable {
    let articles: [Article]
}

struct Article: Codable {
    
    let author: String?
    let title: String
    let description: String
    let publishedAt: String
    let urlToImage: String
    
    var url: Observable<UIImage?> {
        let url = URL(string: urlToImage)!
        let data = try? Data(contentsOf: url)
        let image = UIImage(data: data!)
        return Observable.just(image)
    }
    
}
