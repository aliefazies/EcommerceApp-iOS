//
//  Product.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 12/04/23.
//

import Foundation

// MARK: - Products
struct Products: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}

//// MARK: - Product
//struct Product: Codable {
//    let id: Int
//    let title: String
//    let price: Int
//    let category, description: String
//    let imageURL: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id, title, price, category, description
//        case imageURL = "image_url"
//    }
//}
//
//typealias Products = [Product]
