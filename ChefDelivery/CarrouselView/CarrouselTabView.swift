//
//  CarrouselTabView.swift
//  ChefDelivery
//
//  Created by Daniel Ancines on 23/03/25.
//

import SwiftUI

struct CarrouselTabView: View {
    @State private var currentIndex: Int = 1
    @State private var timer: Timer?
    
    let ordersMock: [OrderType] = [
        OrderType(id:1, name: "banner burguer", image: "barbecue-banner"),
        OrderType(id:2, name: "banner meal", image: "brazilian-meal-banner"),
        OrderType(id:3, name: "banner poke", image: "pokes-banner")
    ]
    
    var body: some View {
        TabView (selection: $currentIndex) {
            ForEach(ordersMock){ orderItem in
                CarrouselItemView(order: orderItem)
                    .tag(orderItem.id)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .onAppear {
            startTimer()
        }
        .onDisappear(){
            stopTimer()
        }
    }
    
    func startTimer(){
        guard timer == nil else { return }
        
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            withAnimation (.easeInOut(duration: 1)) {
                if currentIndex >= ordersMock.count{
                    currentIndex = 1
                } else {
                    currentIndex += 1
                }
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    CarrouselTabView()
}
