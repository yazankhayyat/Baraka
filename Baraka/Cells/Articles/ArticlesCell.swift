//
//  ArticlesCell.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

@IBDesignable class ArticlesCell: UICollectionViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    
    var cellDisposeBag = DisposeBag()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }
    func setup() {
        let view = loadViewFromNib()
        view.frame = bounds
        addSubview(view)
    }
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ArticlesCell", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    func bind(to viewModel: ArticlesCellViewModel) {
        viewModel.title.drive(titleLabel.rx.text).disposed(by: cellDisposeBag)
        viewModel.date.drive(dateLabel.rx.text).disposed(by: cellDisposeBag)
        viewModel.articleImage.drive(articleImage.rx.image).disposed(by: cellDisposeBag)
    }
}
