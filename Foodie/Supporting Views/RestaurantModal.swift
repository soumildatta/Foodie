//
//  RestaurantModal.swift
//  Foodie
//
//  Created by Soumil Datta on 8/4/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import SwiftUI

struct RestaurantModal: View {
    
    // environment variable presentationMode accessed
    // https://stackoverflow.com/questions/56517400/swiftui-dismiss-modal
    @Environment(\.presentationMode) private var presentationMode
    @State private var isPresentingWebView = false
    let mapManager = UserLocationManager()
    
    var restaurantName: String
    var restaurantAddress: String
    var cuisineType: String
    var priceRange: Int
    var rating: String
    var numOfVotes: Int
    var phoneNumber: String
    var url: String?
    
    var latitude: String
    var longitude: String
    
    var body: some View {
        VStack {
            MapView(
                latitude: latitude,
                longitude: longitude,
                title: restaurantName,
                locationName: restaurantAddress)
                .frame(height: 350)
                .edgesIgnoringSafeArea(.top)
            RestaurantModalInfo(restaurantName: restaurantName, restaurantAddress: restaurantAddress, cuisineType: cuisineType, priceRance: priceRange, rating: rating, numOfVotes: numOfVotes, phoneNumber: phoneNumber)
            
            HStack {
                Button(action: {
                    self.mapManager.openMaps(forLatitude: self.latitude, forLongitude: self.longitude, locationName: self.restaurantName)
                }) {
                    Image(systemName: "map")
                        .resizable().frame(width: 18, height: 18)
                        .foregroundColor(.white)
                        .padding(12.5)
                        .padding(.horizontal, 12)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("DeepSeaBlue"), Color("PastelDeepBlue")]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                }.shadow(radius: 3)
                .sheet(isPresented: $isPresentingWebView) {
                    RestaurantDetailWebView(url: self.url)
                }
                
                Button(action: {
                    self.isPresentingWebView.toggle()
                }) {
                    Text("More Info")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(11)
                        .padding(.horizontal, 30)
                        .background(Color("PastelBlue"))
                        .cornerRadius(10)
                }.shadow(radius: 3)
                .sheet(isPresented: $isPresentingWebView) {
                    RestaurantDetailWebView(url: self.url)
                }
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .resizable().frame(width: 18, height: 18)
                        .foregroundColor(.white)
                        .padding(12.5)
                        .padding(.horizontal, 12)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("DeepRed"), Color("Red")]), startPoint: .leading, endPoint: .topTrailing))
                        .cornerRadius(10)
                }.shadow(radius: 3)
            }.padding(.bottom, 25)
        }
    }
}

struct RestaurantModal_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantModal(restaurantName: "Restaurant Name", restaurantAddress: "Location", cuisineType: "Is", priceRange: 4, rating: "4.5", numOfVotes: 18, phoneNumber: "(xxx) xxx xxxx", latitude: "34.3665750000", longitude: "-89.5193210000")
    }
}
