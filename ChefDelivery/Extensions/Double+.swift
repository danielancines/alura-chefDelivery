//
//  Double+.swift
//  ChefDelivery
//
//  Created by Daniel Ancines on 24/03/25.
//
import Foundation

extension Double {
    func formatPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}
