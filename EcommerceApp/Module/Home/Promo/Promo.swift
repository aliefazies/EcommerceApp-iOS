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

public struct PromoProvider {
    static func all() -> Promos {
        return [
            Promo(idPromo: 1, fileName: "promo-tokopedia-agustus", fileURL: "banner1"),
            Promo(idPromo: 2, fileName: "promo-gojek-tokopedia", fileURL: "banner2"),
            Promo(idPromo: 3, fileName: "gojek-free-ongkir", fileURL: "banner3"),
            Promo(idPromo: 4, fileName: "gojek-17-agustus", fileURL: "banner4"),
            Promo(idPromo: 5, fileName: "gojek-x-tokopedia", fileURL: "banner5"),
            Promo(idPromo: 6, fileName: "gojek-bts-tokopedia", fileURL: "banner6")
        ]
    }
}
