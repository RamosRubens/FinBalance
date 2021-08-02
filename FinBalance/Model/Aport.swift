//
//  Aport.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 02/08/21.
//

import Foundation

struct Aport: Decodable {
    let id: Int
    let assetsSymbol: String
    let valueAssets: Float
    let quantityAssets: Float
    
    enum CodingKeys: String, CodingKey {
        case id
        case assetsSymbol
        case valueAssets
        case quantityAssets
    }
}
