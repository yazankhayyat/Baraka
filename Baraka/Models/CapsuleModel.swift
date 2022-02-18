//
//  CapsuleModel.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import Foundation

struct Capsule: Codable, Hashable {
    
    let symbol: String
    let price: String
    
    var key: String = UUID().uuidString

    static func == (lhs: Capsule, rhs: Capsule) -> Bool {
         lhs.key == rhs.key
     }
     
     func hash(into hasher: inout Hasher) {
         hasher.combine(key)
     }

}
