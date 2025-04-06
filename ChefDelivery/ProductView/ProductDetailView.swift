//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Daniel Ancines on 24/03/25.
//

import SwiftUI

struct ProductDetailView: View {
    @State private var quantity = 1
    @Environment(\.presentationMode) var presentationMode
    
    let product: ProductType
    var service = StoreService()
    
    var body: some View {
        VStack{
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            ProductDetailQuantityView(quantity: $quantity)
            
            Spacer()
            
            ProductDetailButtonView {
                Task{
                    await sendOrder()
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
    
    func sendOrder() async {
        do{
            let result = try await service.sendOrder(product: product)
            
            switch result {
            case .success (let message):
                print(message)
            case .failure(let error):
                print(error)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}
