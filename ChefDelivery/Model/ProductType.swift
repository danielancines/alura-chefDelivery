//
//  ProductType.swift
//  ChefDelivery
//
//  Created by Daniel Ancines on 23/03/25.
//

import Foundation

struct ProductType: Identifiable, Decodable, Encodable{
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        return "R$ \(price.formatPrice())"
    }
}
