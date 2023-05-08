//
//  CategoryProductViewModel.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/05/23.
//

import Foundation

class CategoryProductViewModel {
    var categories: [String] = []
    
    func fetchCategories(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/products/categories") else {
            return completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "Invalid HTTP response", code: 0, userInfo: nil)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data returned", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let categories = try JSONDecoder().decode([String].self, from: data)
                self.categories = categories
                completion(.success(categories))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
