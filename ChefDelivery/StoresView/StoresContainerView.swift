//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Daniel Ancines on 23/03/25.
//

import SwiftUI

struct StoresContainerView: View {
    @State private var ratingFilter = 0
    
    let title = "Lojas"
    var stores: [StoreType]
    
    var filteredStores: [StoreType] {
        return stores.filter { store in
            store.stars >= ratingFilter
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                Text(title)
                    .font(.headline)

                Spacer()
                
                Menu("Filtrar"){
                    Button{
                        ratingFilter = 0
                    } label: {
                        Text("Limpar filtro")
                    }
                    
                    Divider()
                    
                    ForEach(1...5, id: \.self){rating in
                        Button(){
                            ratingFilter = rating
                        } label: {
                            if (rating > 1){
                                Text("\(rating) estrelas ou mais")
                            } else {
                                Text("\(rating) estrela ou mais")
                            }
                        }
                    }
                }
                .foregroundColor(.black)
                
            }
            
            VStack(alignment: .leading, spacing: 30){
                if filteredStores.isEmpty {
                    Text("Nenhuma loja encontrada")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color(.colorRed))
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(filteredStores) { mock in
                        NavigationLink(){
                            StoreDetailView(store: mock)
                        } label: {
                            StoreItemView(store: mock)
                        }
                    }
                }
            }
            .foregroundColor(.primary)
        }
        .padding(20)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoresContainerView(stores: storesMock)
}
