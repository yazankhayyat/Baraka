//
//  URLHTTPClient.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import Foundation
import RxSwift
import RxCocoa

class RxURLRequest {
    
    private var urlSession: URLSession
    
    init(config:URLSessionConfiguration) {
      urlSession = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    func get<FeedModel: Decodable>(with request: URLRequest) -> Observable<FeedModel> {
        
        return Observable.create { observer in
            let task = self.urlSession.dataTask(with: request) { (data, response, error) in
          
                if let httpResponse = response as? HTTPURLResponse {
                    let statusCode = httpResponse.statusCode
                        do {
                            let currentData = data ?? Data()
                          
                            if (200...399).contains(statusCode) {
                                let object = try JSONDecoder().decode(FeedModel.self, from: currentData)
                                observer.onNext(object)
                            } else {
                                observer.onError(error!)
                            }
                      } catch {
                        observer.onError(error)
                      }
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
       }
    }
}
