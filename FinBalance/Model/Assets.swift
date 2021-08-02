//
//  Assets.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 31/07/21.
//

import Foundation

struct Assets: Decodable {
    let id: Int
    let type: String
    let totalInWallet: Double
    let atualPercent: Float
    let targetPercent: Float
    
    enum CodingKeys: String, CodingKey {
        case id
        case type = "typeassets"
        case totalInWallet = "totalinwallet"
        case atualPercent = "atualpercent"
        case targetPercent = "targetpercent"
    }
}
