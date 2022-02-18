//
//  ViewController.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import UIKit
import RxCocoa
import RxSwift

enum Section {
    case section1
    case section2
    case section3
}

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var articles: [Article] = []
    let disposeBag = DisposeBag()
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    
    let unknownError = "Something went wrong"
    
    let api = APIClient.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: ArticlesCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: ArticlesCell.defaultReuseIdentifier)
        
        collectionView.register(UINib(nibName: CapsuleCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CapsuleCell.defaultReuseIdentifier)

    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        showDetailViewController(alert, sender: self)
    }

    
}

