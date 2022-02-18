//
//  CapsuleCellViewModel.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import Foundation

import RxSwift
import RxCocoa

class CapsuleCellViewModel {
    
    let symbol: Driver<String>
    let price: Driver<String>

    let key: String
    
    init(with symbol: String, price: String, key: String) {
       self.key = key
        self.symbol = Driver.just(symbol)
        self.price = Driver.just(price)
    }
}
