//
//  BalanceTableViewCell.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 31/07/21.
//

import UIKit

class BalanceTableViewCell: UITableViewCell {

    
    @IBOutlet weak var assetTitle: UILabel!
    @IBOutlet weak var iconType: UIImageView!
    @IBOutlet weak var contributeValue: UILabel!
    @IBOutlet weak var contributeQuantity: UILabel!
    
    func configure(balance: String){
        
    }
}
