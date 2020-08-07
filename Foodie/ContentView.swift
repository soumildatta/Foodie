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
        return VStack(alignment: .center) {
            Text("Foodie")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .padding(.bottom)
            Text("🍷🌮🥗🌯🥘🍲🍱🍜🍣🍛🍷")
                .font(.system(size: 27))
            HStack {
                Spacer()
                Text("top restaurants near you".uppercased())
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                    .padding()
                Spacer()
            }
            List(networkManager.restaurants) { data in
                Button(action: {
                    self.isPresentingModal.toggle()
                }) {
                    RestaurantCardView(
                        locationString: data.restaurant.location.address,
                        restaurantName: data.restaurant.name,
                        cuisineType: data.restaurant.cuisines,
                        timings: data.restaurant.timings,
                        priceRange: data.restaurant.price_range,
                        latitude: data.restaurant.location.latitude,
                        longitude: data.restaurant.location.longitude
                    )
                }
            }
            .onAppear {
                self.networkManager.fetchRestaurantData()
                UITableView.appearance().separatorStyle = .none
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
