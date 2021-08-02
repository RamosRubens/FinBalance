//
//  AssetsInvested.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 31/07/21.
//

import Foundation

struct AssetsInvested: Decodable {
    let type: String
    let totalInWallet: Double
    let symbol: String
    
    static let collection: [AssetsInvested] = [
        AssetsInvested(type: "Ação", totalInWallet: 6000.00, symbol: "TAEE3"),
        AssetsInvested(type: "Ação", totalInWallet: 6000.00, symbol: "WEGE3"),
        AssetsInvested(type: "Ação", totalInWallet: 6000.00, symbol: "FYLR3"),
        AssetsInvested(type: "Ação", totalInWallet: 6000.00, symbol: "ITSA4")
    ]
}
