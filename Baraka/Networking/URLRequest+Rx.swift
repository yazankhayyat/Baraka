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
    
    func get<T: Decodable>(with request: URLRequest) -> Observable<T> {
        
        return Observable.create { observer in
            let task = self.urlSession.dataTask(with: request) { (data, response, error) in
                
                if let httpResponse = response as? HTTPURLResponse {
                    let statusCode = httpResponse.statusCode
                    do {
                        guard let currentData = data else {
                            observer.onError(error!)
                            return
                        }
                        if (200...399).contains(statusCode) {
                            let object = try JSONDecoder().decode(T.self, from: currentData)
                            observer.onNext(object)
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
