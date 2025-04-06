//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Daniel Ancines on 24/03/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductType
    @State private var quantity = 1
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            ProductDetailQuantityView(quantity: $quantity)
            
            Spacer()
            
            ProductDetailButtonView {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}
