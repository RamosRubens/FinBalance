//
//  Float+Extensions.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 30/07/21.
//

import Foundation

extension Float {
    
    var stringValue: String {
        return String(describing: self)
    }
    
    var intValue: Int {
        return Int(self)
    }
    
    var DecimalPlaceString: String {
        return String(format: "%.0f", self)
    }
    
    var percentageFormat: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 0
        return formatter.string(from: self as NSNumber) ?? DecimalPlaceString
    }
}
