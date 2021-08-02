//
//  TargetTableViewCell.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 30/07/21.
//

import UIKit

class TargetTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var percentTextField: UITextField!
    
    @IBAction func percentSlider(_ sender: UISlider) {
        percentTextField.text = "\(sender.value.intValue)%"
    }
    
    func configure(with target: Target) {
        titleLabel.text = target.title
        subTitleLabel.text = target.subTitle
        percentTextField.text = "\(target.percentInWallet.intValue)%"
        slider.value = target.percentInWallet
    }

}
