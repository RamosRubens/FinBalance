//
//  SearchResults.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 26/07/21.
//

import Foundation

struct SearchResults: Decodable {
    let items: [SearchResult]
    enum CodingKeys: String, CodingKey {
        case items = "bestMatches"
    }
}
