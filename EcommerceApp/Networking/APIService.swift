//
//  APIService.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 12/04/23.
//

import Foundation

protocol ApiServiceProtocol {
    func callApi<T: Codable>(with url: String, model: T.Type, completion: @escaping (Result<T, Error>) -> ())
}

struct APIService: ApiServiceProtocol {
    
    func callApi<T>(with url: String, model: T.Type, completion: @escaping (Result<T, Error>) -> ()) where T : Decodable, T : Encodable {
        guard let unwrappedUrl = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: unwrappedUrl) { data, response, error in
            if let data = data {
                do {
                    let dataResponse = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(dataResponse))
                  
                } catch let error {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
