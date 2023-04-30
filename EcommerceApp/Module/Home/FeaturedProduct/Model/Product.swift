//
//  Product.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 12/04/23.
//

import Foundation

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title: String
    let price: Int
    let category, description: String
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id, title, price, category, description
        case imageURL = "image_url"
    }
}

typealias Products = [Product]
