//
//  DetailProductViewModel.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 05/05/23.
//

import Foundation

protocol DetailProductViewModelProtocol {
    var detailProductDataBinding: ((Product?) -> ())? { get set }
}

class DetailProductViewModel: DetailProductViewModelProtocol {
    
    
    private var apiServiceProtocol: ApiServiceProtocol
    
    var id: Int?
    
    private var url: String {
        guard let id = id else { return "" }
        let urlString = "https://dummyjson.com/products/\(id)"
        return urlString
    }
    
    var detailProductDataBinding: ((Product?) -> ())?
    
    init(id: Int, apiServiceProtocol: ApiServiceProtocol) {
        self.id = id
        self.apiServiceProtocol = apiServiceProtocol
        fetchDataDetailProduct()
    }
    
    func fetchDataDetailProduct() {
        self.apiServiceProtocol.callApi(with: self.url, model: Product.self) { response in
            switch response {
            case .success(let product):
                self.detailProductDataBinding?(product)
            case .failure(let error):
                print(error.localizedDescription)
                self.detailProductDataBinding?(nil)
            }
        }
    }
    
}
