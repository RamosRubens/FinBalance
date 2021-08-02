//
//  AssetsWalletTableViewCell.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 31/07/21.
//

import UIKit

class AssetsWalletTableViewCell: UITableViewCell {

    @IBOutlet weak var assetTitle: UILabel!
    @IBOutlet weak var assetValue: UILabel!
    
    func configure(with asset: AssetsInvested){
        assetTitle.text = asset.symbol
        assetValue.text = asset.totalInWallet.toCurrencyFormat(hasDollarSymbol: false, hasDecimalPlaces: true)
    }
    
}
