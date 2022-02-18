//
//  APIClient.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import Foundation
import RxSwift
import RxCocoa

class APIClient {
    static var shared = APIClient()
    
    let url = URL(string:"https://saurav.tech/NewsAPI/everything/cnn.json")!
        
    func getData() -> Observable<Articles> {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField:
                      "Content-Type")
        let helper = RxURLRequest(config: .default)
        return helper.get(with: request)
    }
}
