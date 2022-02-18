//
//  ArticlesCellViewModel.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ArticlesCellViewModel {
    
    let date: Driver<String>
    let title: Driver<String>
    let articleImage: Driver<UIImage>

    let key: String
    
    init(with title: String, date: String, articleImage: UIImage, key: String) {
       self.key = key
        self.title = Driver.just(title)
        self.date = Driver.just(date)
        self.articleImage = Driver.just(articleImage)
    }
}
