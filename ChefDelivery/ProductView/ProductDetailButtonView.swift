//
//  ProductDetailButtonView.swift
//  ChefDelivery
//
//  Created by Daniel Ancines on 25/03/25.
//

import SwiftUI

struct ProductDetailButtonView: View {
    var buttonAction: () -> Void = { }
    public init(_ action: @escaping () -> Void){
        buttonAction = action
    }
    
    var body: some View {
        Button {
            buttonAction()
        } label: {
            HStack{
                Image(systemName: "cart")
                
                Text("Adicionar ao carrinho")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color(.colorRed))
            .foregroundColor(.white)
            .cornerRadius(32)
            .shadow(color: Color(.colorRedDark).opacity(0.5), radius: 10, x: 6, y:8)
        }
    }
}

#Preview {
    ProductDetailButtonView(){
        
    }
}
