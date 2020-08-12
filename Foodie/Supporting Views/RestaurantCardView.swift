//
//  RestaurantCardView.swift
//  Foodie
//
//  Created by Soumil Datta on 8/3/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import SwiftUI

struct RestaurantCardView: View {
    
    @State var isPresentingModal = false
    var locationString: String
    var restaurantName: String
    var cuisineType: String
    var priceRange: Int
    var rating: String
    var numOfVotes: Int
    var phoneNumber: String
    var url: String
    
    var latitude: String
    var longitude: String
    
    var body: some View {
        Button(action: {
            self.isPresentingModal.toggle()
        }) {
            HStack {
                VStack(alignment: .leading) {
                    Text(restaurantName)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.bottom, 8)
                    Text(locationString)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
            )
            .clipped()
            .shadow(radius: 4)
            .padding(.vertical, 5)
        }.sheet(isPresented: $isPresentingModal, content: {
            RestaurantModal(
                restaurantName: self.restaurantName,
                restaurantAddress: self.locationString,
                cuisineType: self.cuisineType,
                priceRange: self.priceRange,
                rating: self.rating,
                numOfVotes: self.numOfVotes,
                phoneNumber: self.phoneNumber,
                url: self.url,
                latitude: self.latitude,
                longitude: self.longitude
            )
        })
    }
}

struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(
            locationString: "Chick-Fil-A Avenue",
            restaurantName: "Chick-Fil-A",
            cuisineType: "Fast Food",
            priceRange: 2,
            rating: "4.5",
            numOfVotes: 18,
            phoneNumber: "(xxx) xxx xxxx",
            url: "https://www.google.com",
            latitude: "34.3665750000",
            longitude: "-89.5193210000"
        )
    }
}
