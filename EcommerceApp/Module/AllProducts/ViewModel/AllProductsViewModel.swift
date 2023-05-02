//
//  AllProductsViewModel.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 02/05/23.
//

import Foundation

protocol AllProductsViewModelProtocol {
    var allProductsDataBinding: ((Products?) -> ())? { get set }
}

class AllProductsViewModel: AllProductsViewModelProtocol {
    private let url = "http://localhost:3003/wishlist"
    private var apiServiceProtocol: ApiServiceProtocol
    
    var allProductsDataBinding: ((Products?) -> ())?
    
    init(apiServiceProtocol: ApiServiceProtocol) {
        self.apiServiceProtocol = apiServiceProtocol
        fetchDataAllProducts()
    }
    
    func fetchDataAllProducts() {
        self.apiServiceProtocol.callApi(with: self.url, model: Products.self, completion: {response in
            switch response {
            case .success(let product):
                self.allProductsDataBinding?(product)
            case .failure(let error):
                print(error.localizedDescription)
                self.allProductsDataBinding?(nil)
            }
        })
    }
}
