//
//  ViewController.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import UIKit
import RxCocoa
import RxSwift

enum Section: Hashable {
    case articles(Article)
    case capsules(Capsule)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let disposeBag = DisposeBag()
    
    typealias DataSource  = UICollectionViewDiffableDataSource<Section, Item>
    
    var dataSource: DataSource!
    
    var articles = [Article]()
    var capsules = [Capsule]()
        
    var articlesViewModel = ArticlesViewModel()

    let api = APIClient.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: ArticlesCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: ArticlesCell.defaultReuseIdentifier)
        
        collectionView.register(UINib(nibName: CapsuleCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CapsuleCell.defaultReuseIdentifier)
        
        api.getData().subscribe(onNext: { [weak self] item in
            self!.articles = item.articles.sorted() {
                return $0.publishedAt.returnDate().compare($1.publishedAt.returnDate()) == .orderedDescending
            }
        }, onCompleted: {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }).disposed(by: disposeBag)
        
        collectionView.collectionViewLayout = createLayout()
        configureDataSource()
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        showDetailViewController(alert, sender: self)
    }
}
