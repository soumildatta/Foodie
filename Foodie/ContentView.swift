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
    @State var showSpinner = true
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
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
                ZStack {
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
                                rating: data.restaurant.user_rating.aggregate_rating,
                                numOfVotes: data.restaurant.user_rating.votes,
                                phoneNumber: data.restaurant.phone_numbers,
                                latitude: data.restaurant.location.latitude,
                                longitude: data.restaurant.location.longitude
                            )
                        }
                    }
                }
            }
            if self.showSpinner {
                SpinnerView()
                    .onAppear(perform: delayText)
            }
        }.onAppear {
            self.networkManager.fetchRestaurantData()
            UITableView.appearance().separatorStyle = .none
        }
    }
    
    // dismiss spinner after 2 seconds
    private func delayText() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showSpinner.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
