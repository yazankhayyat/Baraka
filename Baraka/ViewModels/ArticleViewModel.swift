//
//  ArticleViewModel.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import Foundation
import RxSwift

struct ArticlesViewModel {

    var items: Observable<[Article]>
//    var error: Observable<Error>?
    
    init() {
        items = APIClient.shared.getData().flatMap({ item in
            Observable.just(item.articles.sorted(by: { item1, item2 in
                return DateFormatter().date(from: item1.publishedAt)! > DateFormatter().date(from: item1.publishedAt)!
            }))
        })
        
    }
}
