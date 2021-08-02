//
//  String+Extensions.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 27/07/21.
//

import Foundation

import Foundation

extension String {
    
    func addBrackets() -> String {
        return "(\(self))"
    }
    
    func prefix(withText text: String) -> String {
        return text + self
    }
    
    func toDouble() -> Double? {
        return Double(self)
    }
    
    func toFloat() -> Float? {
        return Float(self)
    }
    
}
