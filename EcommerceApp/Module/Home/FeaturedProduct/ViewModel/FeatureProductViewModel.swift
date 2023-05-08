//
//  FeaturedProductViewModel.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 13/04/23.
//

import Foundation

protocol FeaturedProductViewModelProtocol {
    var featuredProductDataBinding: ((Products?) -> ())? { get set }
}

class FeaturedProductViewModel: FeaturedProductViewModelProtocol {
    private let url = "https://dummyjson.com/products"
    private var apiServiceProtocol: ApiServiceProtocol

    var featuredProductDataBinding: ((Products?) -> ())?

    init(apiServiceProtocol: ApiServiceProtocol) {
        self.apiServiceProtocol = apiServiceProtocol
        fetchDataFeaturedProduct()
    }

    func fetchDataFeaturedProduct() {
        self.apiServiceProtocol.callApi(with: self.url, model: Products.self, completion: { response in
            switch response {
            case .success(let product):
                self.featuredProductDataBinding?(product)
            case .failure(let error):
                print(error.localizedDescription)
                self.featuredProductDataBinding?(nil)
            }
        })
    }
}
