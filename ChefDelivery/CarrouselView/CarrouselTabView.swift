//
//  CarrouselTabView.swift
//  ChefDelivery
//
//  Created by Daniel Ancines on 23/03/25.
//

import SwiftUI

struct CarrouselTabView: View {
    let ordersMock: [OrderType] = [
        OrderType(id:1, name: "banner burguer", image: "barbecue-banner"),
        OrderType(id:2, name: "banner meal", image: "brazilian-meal-banner"),
        OrderType(id:3, name: "banner poke", image: "pokes-banner")
    ]
    
    var body: some View {
        TabView{
            ForEach(ordersMock){ orderItem in
                CarrouselItemView(order: orderItem)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    CarrouselTabView()
}
