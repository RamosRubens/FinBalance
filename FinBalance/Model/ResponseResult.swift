//
//  ResponseResult.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 02/08/21.
//

import Foundation

struct ResponseResult: Codable {
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
    }
}

