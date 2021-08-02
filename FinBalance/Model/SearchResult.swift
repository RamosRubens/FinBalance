//
//  SearchResult.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 26/07/21.
//

import Foundation

struct SearchResult: Decodable {
    
    let symbol: String
    let name: String
    let type: String
    let currency: String
    
    enum CodingKeys: String, CodingKey {
        case symbol = "1. symbol"
        case name = "2. name"
        case type = "3. type"
        case currency = "8. currency"
    }
}
