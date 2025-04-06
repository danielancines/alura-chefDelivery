//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Daniel Ancines on 20/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var stores: [StoreType] = []
    @State private var isLoading: Bool = true
    
    private var storeService = StoreService()
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                } else {
                    NavigationBar()
                        .padding(.horizontal, 15)
                    
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing: 20){
                            OrderTypeGridView()
                            CarrouselTabView()
                            StoresContainerView(stores: stores)
                        }
                    }
                }
            }
            .refreshable {
                Task{
                    getStores()
                }
            }
        }
        .onAppear() {
            Task {
                getStores()
            }
        }
    }
    
    func getStores() {
        storeService.fetchServices { stores, error in
            self.stores = stores ?? []
            self.isLoading = false
        }
    }
    
// Example withou Alamofire
//    func getStores() async {
//        do{
//            let result = try await storeService.fetchServices()
//            switch result {
//            case .success(let stores):
//                self.stores = stores
//                break
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
}

#Preview {
    ContentView()
}
