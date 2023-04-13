//
//  Promo.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 12/04/23.
//

import Foundation

// MARK: - Promo
struct Promo: Codable {
    let idPromo: Int
    let fileName: String
    let fileURL: String
    
    enum CodingKeys: String, CodingKey {
        case idPromo = "id"
        case fileName = "file_name"
        case fileURL = "file_url"
    }
}

typealias Promos = [Promo]
