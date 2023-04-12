//
//  Category.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 12/04/23.
//

import Foundation

struct Category: Codable {
    let idCategory: Int
    let name: String
    let icon: String
    
    
    enum CodingKeys: String, CodingKey {
        case idCategory = "id"
        case name, icon
    }
    
}

typealias Categories = [Category]

public struct CategoryProvider {
    static func all() -> Categories {
        return [
            Category(idCategory: 1, name: "Smartphone", icon: "smartphone"),
            Category(idCategory: 2, name: "Ultrabook", icon: "ultrabook"),
            Category(idCategory: 3, name: "Smart TV", icon: "tv"),
            Category(idCategory: 4, name: "Mouse", icon: "mouse"),
            Category(idCategory: 5, name: "Keyboard", icon: "keyboard"),
            Category(idCategory: 6, name: "Jam Tangan", icon: "watch"),
            Category(idCategory: 7, name: "Gitar", icon: "music")
        ]
    }
}
