//
//  ProductPerCategory.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 07/05/23.
//

import Foundation

protocol ProductPerCategoryViewModelProtocol {
    var ProductPerCategoryDataBinding: ((Products?) -> ())? { get set }
}

class ProductPerCategoryViewModel: ProductPerCategoryViewModelProtocol {
    private var apiServiceProtocol: ApiServiceProtocol
    
    var ProductPerCategoryDataBinding: ((Products?) -> ())?
    
    var category: String?
    
    private var url: String {
        guard let category = category else { return "" }
        let urlString = "https://dummyjson.com/products/category/\(category)"
        print(urlString)
        return urlString
    }
    
    init(category: String, apiServiceProtocol: ApiServiceProtocol) {
        self.category = category
        self.apiServiceProtocol = apiServiceProtocol
        fetchDataAllProducts()
    }
    
    func fetchDataAllProducts() {
        self.apiServiceProtocol.callApi(with: self.url, model: Products.self, completion: {response in
            switch response {
            case .success(let product):
                self.ProductPerCategoryDataBinding?(product)
            case .failure(let error):
                print(error.localizedDescription)
                self.ProductPerCategoryDataBinding?(nil)
            }
        })
    }
}
