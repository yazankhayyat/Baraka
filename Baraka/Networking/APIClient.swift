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
        
    let csvLink = "https://raw.githubusercontent.com/dsancov/TestData/main/stocks.csv"
    
    func getData() -> Observable<Articles> {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField:
                      "Content-Type")
        let helper = RxURLRequest(config: .default)
        return helper.get(with: request)
    }
    
//    func getCapsules() -> Observable<[Capsule]> {
//        var dataArray = [[String]]()
//           let url = URL(string: csvLink)!
//           do {
//               let data = try Data(contentsOf: url)
//               let dataEncoded = String(data: data, encoding: .utf8)
//               if  let dataArr = dataEncoded?.components(separatedBy: "\r\n").map({ $0.components(separatedBy: ";") }) {
//                   for line in dataArr {
//                       dataArray.append(line)
//                   }
//               }
//           } catch let jsonErr {
//               print("\n Error reading CSV file: \n ", jsonErr)
//           }
//        return Observable.of(dataArray)
//    }
    
}
