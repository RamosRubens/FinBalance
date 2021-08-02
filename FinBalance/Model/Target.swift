//
//  Target.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 30/07/21.
//

import Foundation

struct Target: Decodable {
    
    let id: Int
    let title: String
    let subTitle: String
    let percentInWallet: Float
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "targettype"
        case subTitle = "targetdescription"
        case percentInWallet = "targetvalue"
    }
}
