//
//  ContentView.swift
//  Foodie
//
//  Created by Soumil Datta on 8/3/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPresentingModal = false
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        print(networkManager.$restaurants)
        
        return VStack(alignment: .center) {
            Text("Foodie")
                .font(.system(size: 50))
                .fontWeight(.bold)
            HStack {
                Spacer()
                Text("top restaurants near you".uppercased())
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                    .padding()
                Spacer()
            }
//            List(networkManager.restaurants) { item in
//                VStack {
//                    Text(item.restaurant.name)
//                    Text(item.restaurant.location.address)
//                    Text(String(item.restaurant.price_range))
//                    //                        Text(location.entity_type)
//                }
//            }
            List(networkManager.restaurants) { data in
                Button(action: {
                    self.isPresentingModal.toggle()
                }) {
                    RestaurantCardView(locationString: data.restaurant.location.address, restaurantName: data.restaurant.name)
                }
            }
            .onAppear {
                self.networkManager.fetchRestaurantData()
                UITableView.appearance().separatorStyle = .none
            }
            .sheet(isPresented: $isPresentingModal, content: {
                RestaurantModal()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
