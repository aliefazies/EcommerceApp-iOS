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

public struct productProvider {
    static func all() -> Products {
        return [
            Product(id: 110, title: "iPhone 13", price: 13999000, category: "smartphone", description: "iPhone 13 keren banget", imageURL: "https://fdn.gsmarena.com/imgroot/news/21/04/iphone-13-product-red-renders/-1200/gsmarena_003.jpg"),
            Product(id: 135, title: "Samsung Galaxy S21 Ultra", price: 18999000, category: "smartphone", description: "Samsung semakin di dean", imageURL: "https://y6a2n7m3.rocketcdn.me/wp-content/uploads/2020/10/Samsung-Galaxy-S21-Ultra-001.jpg"),
            Product(id: 144, title: "Dell XPS 13 9130", price: 21999000, category: "ultrabook", description: "Dell XPS bisa touch screen", imageURL: "https://static.bmdstatic.com/gk/production/bb0895cac42e0fa533aa2105346d3be6.jpg"),
            Product(id: 215, title: "Logitech Gaming Mouse G102", price: 215000, category: "mouse", description: "Mouse gaming budget to performance terbaik", imageURL: "https://upload.jaknot.com/2020/07/images/products/708ed7/original/logitech-lightsync-rgb-gaming-mouse-g102.jpg"),
            Product(id: 315, title: "Mechanical Keyboard Keychron K2", price: 1399000, category: "keyboard", description: "Keyboard compatible Mac dan Windows", imageURL: "https://cdn.shopify.com/s/files/1/0632/4610/6803/products/Keychron-K2-hot-swappable-wireless-mechanical-keyboard-for-Mac-Windows-Gateron-switch-red-with-type-C-RGB-white-backlight_aa55cdb9-fc2c-47d9-9aa7-4062a386ab0f_1800x1800.jpg?v=1661500729")
        ]
    }
}
