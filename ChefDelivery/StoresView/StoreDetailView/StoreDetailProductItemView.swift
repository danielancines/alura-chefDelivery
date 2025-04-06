//
//  StoreDetailProductView.swift
//  ChefDelivery
//
//  Created by Daniel Ancines on 25/03/25.
//

import SwiftUI

struct StoreDetailProductItemView: View {
    let product: ProductType
    var body: some View {
        HStack(spacing:8){
            VStack(alignment: .leading, spacing: 8){
                Text(product.name)
                    .foregroundColor(.primary)
                    .bold()
                Text(product.description)
                    .foregroundColor(.primary)
                    .foregroundColor(.black.opacity(0.5))
                    .multilineTextAlignment(.leading)
                Text(product.formattedPrice)
                    .foregroundColor(.primary)
            }
            
            Spacer()
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .frame(width: 120, height: 120)
                .shadow(color:.black.opacity(0.3), radius: 20, x: 6, y: 8)
        }
        .padding()
        .foregroundColor(.black)
    }
}

#Preview {
    StoreDetailProductItemView(product: storesMock[0].products[0])
}
