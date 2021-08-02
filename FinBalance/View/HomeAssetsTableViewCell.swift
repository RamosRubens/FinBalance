//
//  HomeTableViewCell.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 31/07/21.
//

import UIKit

class HomeAssetsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var assetTitle: UILabel!
    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet weak var atualPercent: UILabel!
    @IBOutlet weak var targetPercent: UILabel!
    @IBOutlet weak var percentSliderInWallet: UISlider!
    
    func configure(with assets: Assets){
        assetTitle.text = assets.type
        totalValue.text = "R$ \(assets.totalInWallet.toCurrencyFormat(hasDollarSymbol: false, hasDecimalPlaces: true))"
        atualPercent.text = "\(assets.atualPercent.intValue)%"
        targetPercent.text = "\(assets.targetPercent.intValue)%"
        percentSliderInWallet.value = assets.atualPercent
        percentSliderInWallet.maximumValue = assets.targetPercent
        percentSliderInWallet.minimumValue = .zero
    }
}
