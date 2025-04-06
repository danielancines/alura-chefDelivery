//
//  File.swift
//  ChefDelivery
//
//  Created by Daniel Ancines on 06/04/25.
//

import Foundation
import Alamofire

enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct StoreService{
    func fetchServices(completion: @escaping ([StoreType]?, RequestError?) -> Void) {
        AF.request("https://private-4eb264-danielancines.apiary-mock.com/stores")
            .responseDecodable(of: [StoreType].self) { response in
                switch response.result {
                case .success(let stores):
                    completion(stores, nil)
                case .failure(let error):
                    completion([], .errorRequest(error: error.localizedDescription))
                }
            }
        
//        guard let url = URL(string: "https://private-4eb264-danielancines.apiary-mock.com/stores") else {
//            return .failure(.invalidURL)
//        }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        
//        let (data, _) = try await URLSession.shared.data(for: request)
//        let stores = try JSONDecoder().decode([StoreType].self, from: data)
//        
//        return .success(stores)
    }
    
    func sendOrder(product: ProductType) async throws -> Result<[String: Any]?, RequestError>{
        guard let url = URL(string: "https://private-4eb264-danielancines.apiary-mock.com/stores") else {
            return .failure(.invalidURL)
        }
        
        let encodedOrder = try JSONEncoder().encode(product)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodedOrder
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let message = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        
        return .success(message)
    }
}
