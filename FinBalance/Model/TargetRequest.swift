//
//  Target.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 30/07/21.
//

import Foundation

struct TargetRequest: Codable {
    
    let id: Int
    let percentInWallet: Float
    
    enum CodingKeys: String, CodingKey {
        case id
        case percentInWallet = "targetValue"
    }
}
