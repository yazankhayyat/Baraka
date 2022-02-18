//
//  ImageViewModel.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import Foundation
import RxSwift
import RxCocoa


struct ImageViewModel {
    
    let feedModel: FeedModel
    
    init(_ feedModel: FeedModel) {
        self.feedModel = feedModel
    }
}

extension ImageViewModel {
    
    var url: Observable<UIImage?> {

        let url = URL(string: feedModel.urlToImage)!
        let data = try? Data(contentsOf: url)
        let image = UIImage(data: data!)
        return Observable.just(image)
    }
}
