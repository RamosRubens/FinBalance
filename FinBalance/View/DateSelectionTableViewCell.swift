//
//  DateSelectionTableViewCell.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 28/07/21.
//

import UIKit

class DateSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var monthsAgoLabel: UILabel!
    
    func configure(with monthInfo: MonthInfo, index: Int, isSelected: Bool){
        dateLabel.text = monthInfo.date.MMYYFormat
        accessoryType = isSelected ? .checkmark : .none
        if index == 1 {
            monthsAgoLabel.text = "1 mês atrás"
        } else if index > 1 {
            monthsAgoLabel.text = "\(index) meses atrás"
        } else {
            monthsAgoLabel.text = "Recentemente"
        }
    }
}
