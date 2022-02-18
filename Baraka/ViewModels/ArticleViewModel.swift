//
//  ArticleViewModel.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import Foundation
import RxSwift
import RxCocoa

class ArticlesViewModel {

    var items = BehaviorRelay<[Article]>(value: [])
//    var error: Observable<Error>?
    var disposeBag = DisposeBag()
    
}

extension String {
    
    func returnDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM, yyyy"
        return dateFormatter.date(from: self) ?? Date()
    }
}
