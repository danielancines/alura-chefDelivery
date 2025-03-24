//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Daniel Ancines on 23/03/25.
//

import SwiftUI

struct StoresContainerView: View {
    let title = "Lojas"
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 30){
                ForEach(storesMock) { mock in
                    NavigationLink(){
                        StoreDetailView(store: mock)
                    } label: {

                        StoreItemView(store: mock)
                    }
                }
            }
            .foregroundColor(.primary)
        }
        .padding(20)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoresContainerView()
}
