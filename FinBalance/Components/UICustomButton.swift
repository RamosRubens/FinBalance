//
//  UICustomButton.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 28/07/21.
//

import UIKit

@IBDesignable
class UICustomButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 10 {
        didSet {
           layer.cornerRadius = cornerRadius
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configure()
    }
}

private extension UICustomButton {
    func configure() {
        layer.cornerRadius = cornerRadius
    }
}
