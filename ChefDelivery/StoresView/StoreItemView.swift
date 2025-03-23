//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Daniel Ancines on 23/03/25.
//

import SwiftUI

struct StoreItemView: View {
    let order: OrderType
    var body: some View {
        HStack {
            Image(order.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50)
            Text(order.name)
                .font(.subheadline)
            
            Spacer()
        }
        .onTapGesture {
            print("clicou em \(order.name)")
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoreItemView(order: OrderType(id:1, name: "Monstro Burguer", image: "monstro-burger-logo"))
}
