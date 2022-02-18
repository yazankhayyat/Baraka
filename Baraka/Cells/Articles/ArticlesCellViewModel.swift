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

class ArticlesCellViewModel: Hashable {
    
    let date: Driver<String>
    let title: Driver<String>
    let articleImage: Driver<UIImage?>

    let id: String
    
    init(with title: String, date: String, articleImage: String, id: String) {
        self.id = id
        self.title = Driver.just(title)
        self.date = Driver.just(date)
        self.articleImage = Driver.just(UIImage(named: articleImage))
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ArticlesCellViewModel, rhs: ArticlesCellViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}

