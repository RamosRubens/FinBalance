//
//  Date+Extensions.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 28/07/21.
//

import Foundation

extension Date {
    
    var MMYYFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
    
}
