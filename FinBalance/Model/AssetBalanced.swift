//
//  AssetBalanced.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 31/07/21.
//

import Foundation

struct AssetBalanced: Decodable {
    
    let assetsInvested: [AssetsInvested]
    let targetInWallet: [Target]
    
    static let collection: [AssetsInvested] = [
        AssetsInvested(type: "Ação", totalInWallet: 6000.00, symbol: "TAEE3"),
        AssetsInvested(type: "Ação", totalInWallet: 6000.00, symbol: "WEGE3"),
        AssetsInvested(type: "Ação", totalInWallet: 6000.00, symbol: "FYLR3"),
        AssetsInvested(type: "Ação", totalInWallet: 6000.00, symbol: "ITSA4")
    ]
}
