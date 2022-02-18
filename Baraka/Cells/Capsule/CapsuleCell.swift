//
//  CapsuleCell.swift
//  Baraka
//
//  Created by Yazan Khayyat on 2022-02-18.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class CapsuleCell: UICollectionViewCell {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    
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
        let nib = UINib(nibName: "CapsuleCell", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    func bind(to viewModel: CapsuleCellViewModel) {
        viewModel.symbol.drive(symbolLabel.rx.text).disposed(by: cellDisposeBag)
        viewModel.price.drive(priceLabel.rx.text).disposed(by: cellDisposeBag)
    }
}
