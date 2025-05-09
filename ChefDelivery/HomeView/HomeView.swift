//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Daniel Ancines on 28/03/25.
//

import SwiftUI

struct HomeView: View {
    @State private var isAnimating = false
    @State private var imageOffset: CGSize = .zero
    @State private var buttonOffset: CGFloat = 0
    @State private var showSecondScreen = false
    
    let buttonHeight: CGFloat = 80
    
    var body: some View {
        GeometryReader {geometry in
            ZStack {
                Circle()
                    .foregroundColor(Color(.colorRed))
                    .frame(width: isAnimating ? 200 : 0)
                    .position(x:isAnimating ? 50 : -50, y: isAnimating ? 100 : -100)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
                Circle()
                    .foregroundColor(Color(.colorRedDark))
                    .frame(width: isAnimating ? 200 : 0)
                    .position(x: isAnimating ? geometry.size.width - 50 : geometry.size.width + 50,
                              y: isAnimating ? geometry.size.height - 50 : geometry.size.height + 50)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
                VStack{
                    Text("Chef Delivery")
                        .font(.system(size: 48))
                        .fontWeight(.heavy)
                        .foregroundColor(Color(.colorRed))
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Text("Peça as suas comidas no conforto da sua casa!")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.primary)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(isAnimating ? 32 : 92)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(x: imageOffset.width, y: imageOffset.height)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        imageOffset = gesture.translation
                                    }
                                })
                                .onEnded { _ in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        imageOffset = .zero
                                    }
                        })
                    
                    ZStack{
                        Capsule()
                            .fill(Color(.colorRed).opacity(0.2))
                        
                        Capsule()
                            .fill(Color(.colorRed).opacity(0.2))
                            .padding(8)
                        
                        Text("Descubra mais")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color(.colorRedDark))
                            .offset(x: 20)
                        
                        HStack{
                            Capsule()
                                .fill(Color(.colorRed))
                                .frame(width: buttonOffset + buttonHeight)
                            
                            Spacer()
                        }
                        
                        HStack{
                            ZStack{
                                Circle()
                                    .fill(Color(.colorRed))
                                
                                Circle()
                                    .fill(Color(.colorRedDark))
                                    .padding(8)
                                
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 24))
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                            .onChanged( { gesture in
                                if (gesture.translation.width < 0 || buttonOffset > (geometry.size.width - 60 - buttonHeight)){
                                    return
                                }
                                    
                                withAnimation (.easeInOut(duration: 0.25)) {
                                    buttonOffset = gesture.translation.width
                                }
                            })
                            .onEnded({ _ in
                                if buttonOffset > (geometry.size.width - 60) / 2 {
                                    buttonOffset = geometry.size.width - 60 - buttonHeight
                                    showSecondScreen = true
                                } else {
                                    withAnimation (.easeInOut(duration: 0.25)) {
                                        buttonOffset = 0
                                    }
                                }
                            }))
                    }
                    .frame(width: geometry.size.width - 60, height: buttonHeight)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : 100)
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 1)) {
                        isAnimating = true
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showSecondScreen) {
            ContentView()
        }
    }
}

#Preview {
    HomeView()
}
