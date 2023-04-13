//
//  PromoViewModel.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 12/04/23.
//

import Foundation

protocol PromoViewModelProtocol {
    var promoDataBinding: ((Promos?) -> ())? { get set }
}

class PromoViewModel: PromoViewModelProtocol {
    private let url = "http://localhost:3003/promos"
    private var apiServiceProtocol: ApiServiceProtocol?
    
    var promoDataBinding: ((Promos?) -> ())?
    
    init(apiServiceProtocol: ApiServiceProtocol) {
        self.apiServiceProtocol = apiServiceProtocol
        fetchDataPromo()
    }
    
    func fetchDataPromo() {
        self.apiServiceProtocol?.callApi(with: self.url, model: Promos.self, completion: { response in
            switch response {
            case .success(let promo):
                self.promoDataBinding?(promo)
            case .failure(let error):
                print("error binding in viewmodel :\(error.localizedDescription)")
                self.promoDataBinding?(nil)
            }
        })
    }
}
