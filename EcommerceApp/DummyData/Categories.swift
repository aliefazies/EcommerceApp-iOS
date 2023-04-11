//
//  Categories.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 10/04/23.
//

import Foundation
import UIKit

public struct Categories {
    var imageName: String
    var name: String
}

public struct CategoriesProvider {
    static func cats() -> [Categories] {
        return [
            Categories(imageName: "btn_foods", name: "food"),
            Categories(imageName: "btn_eggs", name: "egg"),
            Categories(imageName: "btn_fruits", name: "fruit"),
            Categories(imageName: "btn_meats_grn", name: "vegetable"),
            Categories(imageName: "btn_meats", name: "meat")
        ]
    }
}
