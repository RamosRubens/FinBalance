//
//  SearchTableViewCell.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 26/07/21.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var assetNameLabel: UILabel!
    @IBOutlet weak var assetSymbolLabel: UILabel!
    @IBOutlet weak var assetTypeLabel: UILabel!
    
    func configure(with searchResult: SearchResult) {
        assetNameLabel.text = searchResult.name
        assetSymbolLabel.text = searchResult.symbol
        assetTypeLabel.text = searchResult.type
            .appending(" ")
            .appending(searchResult.currency)
    }
}
