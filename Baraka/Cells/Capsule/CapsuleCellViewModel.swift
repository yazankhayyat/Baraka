//
//  CapsuleCellViewModel.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import Foundation

import RxSwift
import RxCocoa

class CapsuleCellViewModel: Hashable {
    
    let symbol: Driver<String>
    let price: Driver<String>

    let id: String
    
    init(with symbol: String, price: String, id: String) {
        self.id = id
        self.symbol = Driver.just(symbol)
        self.price = Driver.just(price)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: CapsuleCellViewModel, rhs: CapsuleCellViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
