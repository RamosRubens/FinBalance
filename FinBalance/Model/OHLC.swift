//
//  OHLC.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 27/07/21.
//

import Foundation

struct OHLC: Decodable {
    let open: String
    let close: String
    let adjustedClose: String
    
    enum CodingKeys: String, CodingKey {
        case open = "1. open"
        case close = "4. close"
        case adjustedClose = "5. adjusted close"
    }
}
