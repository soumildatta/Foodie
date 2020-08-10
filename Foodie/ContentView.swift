//
//  ContentView.swift
//  Foodie
//
//  Created by Soumil Datta on 8/3/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
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
                Spacer()
                ZStack {
                    if (networkManager.exposedLocationTrue) {
                        VStack {
                            HStack {
                                Spacer()
                                Text("top restaurants near \(networkManager.placemarkString)".uppercased())
                                    .fontWeight(.medium)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.gray)
                                    .padding(.top, 6)
                                Spacer()
                            }
                            List(networkManager.restaurants) { data in
                                // use button to prevent entire list row from being highlighted when clicked
                                Button(action: {
                                }) {
                                    RestaurantCardView(
                                        locationString: data.restaurant.location.address,
                                        restaurantName: data.restaurant.name,
                                        cuisineType: data.restaurant.cuisines,
                                        priceRange: data.restaurant.price_range,
                                        rating: data.restaurant.user_rating.aggregate_rating,
                                        numOfVotes: data.restaurant.user_rating.votes,
                                        phoneNumber: data.restaurant.phone_numbers,
                                        url: data.restaurant.url,
                                        latitude: data.restaurant.location.latitude,
                                        longitude: data.restaurant.location.longitude
                                    )
                                }
                            }
                        }
                        if self.showSpinner {
                            SpinnerView()
                                .onAppear(perform: delayText)
                        }
                    } else {
                        Text("Location services for this app are turned off. Please turn them on through the system settings.").padding(.bottom, 300)
                    }
                }
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
