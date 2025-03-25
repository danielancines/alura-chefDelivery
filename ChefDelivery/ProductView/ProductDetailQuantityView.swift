//
//  ProductDetailQuantityView.swift
//  ChefDelivery
//
//  Created by Daniel Ancines on 25/03/25.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    @Binding var quantity: Int
    
    var body: some View {
        VStack(spacing:16) {
            Text("Quantidade")
                .font(.title3)
                .bold()
            
            HStack{
                Button {
                    if quantity > 1{
                        quantity -= 1
                    }
                        
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title)
                        .bold()
                }
                .disabled(quantity <= 1 ? true : false)
                
                Text("\(quantity)")
                    .font(.title2)
                    .bold()
                
                Button {
                    quantity += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .bold()
                }
            }
        }
    }
}

#Preview {
    ProductDetailQuantityView(quantity: .constant(1))
}
