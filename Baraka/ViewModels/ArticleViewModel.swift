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
    
    func loadItems() {
        APIClient.shared.getData().subscribe(onNext: { [weak self] item in
            Observable.just(item.articles.sorted() {
                print($0)
                return $0.publishedAt.returnDate().compare($1.publishedAt.returnDate()) == .orderedDescending
             }).bind(to: self!.items).disposed(by: self!.disposeBag)
        }).disposed(by: disposeBag)
    }
}

extension String {
    
    func returnDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM, yyyy"
        return dateFormatter.date(from: self) ?? Date()
    }
}
