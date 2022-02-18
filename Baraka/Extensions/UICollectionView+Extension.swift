//
//  UICollectionView+.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import Foundation
import UIKit

extension UICollectionView {
    
    private func createListLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex: Int , environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            if sectionIndex == 0 {
                return self?.createCapsulesLayout()
            } else {
                return self?.createArticlesLayout()
            }
        }
        return layout
    }
    
    private func createCapsulesLayout() -> NSCollectionLayoutSection {
        
        let item = createItem(width: 1.0, height: 1.0)
      
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(74.0))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
      
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        return section
        
    }
    
    private func createArticlesLayout() -> NSCollectionLayoutSection {
        
        let item = createItem(width: 0.4, height: 1.0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(74.0))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
      
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        return section
        
    }
    
    private func createItem(width:  CGFloat, height:  CGFloat) ->  NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(width),
                                             heightDimension: .fractionalHeight(height))
        return NSCollectionLayoutItem(layoutSize: itemSize)
    }
    
    private func createGroup(width:  CGFloat, height:  CGFloat) ->  NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(width),
                                             heightDimension: .fractionalHeight(height))
        return NSCollectionLayoutItem(layoutSize: itemSize)
    }
}

extension UICollectionViewCell: ReusableView {

    static func register(for collectionView: UICollectionView)  {
        let cellIdentifier = defaultReuseIdentifier
        let cellNib = UINib(nibName: String(describing: self), bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
    }
}
