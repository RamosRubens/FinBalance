//
//  InvestTableViewCell.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 09/08/21.
//

import UIKit

class InvestTableViewCell: UITableViewCell {

    @IBOutlet weak var symbolAsset: UILabel!
    @IBOutlet weak var valueAsset: UILabel!
    @IBOutlet weak var percentWalletValue: UILabel!
    @IBOutlet weak var percentTypeValue: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    func configure(with assets: Assets){
        symbolAsset.text = assets.type
        valueAsset.text = "R$ \(assets.totalInWallet.toCurrencyFormat(hasDollarSymbol: false, hasDecimalPlaces: true))"
        percentWalletValue.text = "\(assets.atualPercent.intValue)%"
        percentTypeValue.text = "\(assets.targetPercent.intValue)%"
        slider.value = assets.atualPercent
        slider.maximumValue = assets.targetPercent
        slider.minimumValue = .zero
    }
}
