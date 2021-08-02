//
//  Meta.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 27/07/21.
//

import Foundation

struct Meta: Decodable {
    let symbol: String
    enum CodingKeys: String, CodingKey {
        case symbol = "2. Symbol"
    }
}
