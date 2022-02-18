//
//  UICollectionView+.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import Foundation
import UIKit

enum Item: Hashable {
  case firstSection(CapsuleCellViewModel)
  case secondSection(ArticlesCellViewModel)
}

extension UICollectionViewCell: ReusableView {

    static func register(for collectionView: UICollectionView)  {
        let cellIdentifier = defaultReuseIdentifier
        let cellNib = UINib(nibName: String(describing: self), bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
    }
}
