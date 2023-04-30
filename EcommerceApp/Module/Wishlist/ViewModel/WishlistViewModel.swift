//
//  WishlistViewModel.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 13/04/23.
//

import Foundation

protocol WishlistViewModelProtocol {
    var wishlistDataBinding: ((Products?) -> ())? { get set }
}

class WishlistViewModel: WishlistViewModelProtocol {
    private let url = "http://localhost:3003/wishlist"
    private var apiServiceProtocol: ApiServiceProtocol

    var wishlistDataBinding: ((Products?) -> ())?

    init(apiServiceProtocol: ApiServiceProtocol) {
        self.apiServiceProtocol = apiServiceProtocol
        fetchDataWishlist()
    }

    func fetchDataWishlist() {
        self.apiServiceProtocol.callApi(with: self.url, model: Products.self, completion: { response in
            switch response {
            case .success(let product):
                self.wishlistDataBinding?(product)
            case .failure(let error):
                print(error.localizedDescription)
                self.wishlistDataBinding?(nil)
            }
        })
    }
}
