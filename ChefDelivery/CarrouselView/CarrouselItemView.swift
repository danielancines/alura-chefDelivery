//
//  CarrouselItemView.swift
//  ChefDelivery
//
//  Created by Daniel Ancines on 23/03/25.
//

import SwiftUI

struct CarrouselItemView: View {
    let order: OrderType
    
    var body: some View {
        Image(order.image)
            .resizable()
            .scaledToFit()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CarrouselItemView(order: OrderType(id: 1, name: "", image: "barbecue-banner"))
        .padding()
}
