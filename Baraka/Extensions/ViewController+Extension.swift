//
//  ViewController+Extension.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import UIKit
import RxCocoa
import RxSwift

extension ViewController {
    
    func configureDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, index, item) -> UICollectionViewCell in

                switch item {
                case .firstSection(let vm):
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CapsuleCell.defaultReuseIdentifier, for: index) as? CapsuleCell else {
                        fatalError("Couldn't Create New Cell")
                    }
                    cell.bind(to: vm)
                    return cell
                case .secondSection(let vm):
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticlesCell.defaultReuseIdentifier, for: index) as? ArticlesCell else {
                        fatalError("Couldn't Create New Cell")
                    }
                    cell.bind(to: vm)
                    return cell
                }

            })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        
        articles.forEach { article in
            let vm = ArticlesCellViewModel(with: article.title, date: article.publishedAt, articleImage: article.urlToImage, id: article.source.id)
            snapshot.appendItems([Item.secondSection(vm)], toSection: .articles(article))
        }
        
        dataSource.apply(snapshot)
    }
    
    
    func createLayout() -> UICollectionViewCompositionalLayout {

        return UICollectionViewCompositionalLayout { [weak self]  (sectionNumber, env) -> NSCollectionLayoutSection? in

         switch sectionNumber {

            case 0: return self?.createCapsulesLayout()
            case 1: return self?.createArticlesLayout()
            default: return nil
            
         }
       }
    }
    
    
    private func createCapsulesLayout() -> NSCollectionLayoutSection {
        
        let item = createItem(width: 1.0, height: 1.0)
      
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(74.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
      
        let section = createSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
        
    }
    
    private func createArticlesLayout() -> NSCollectionLayoutSection {
        
        let item = createItem(width: 0.4, height: 1.0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(74.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = createSection(group: group)
        return section
        
    }
    
    private func createSection(group: NSCollectionLayoutGroup) -> NSCollectionLayoutSection {
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
