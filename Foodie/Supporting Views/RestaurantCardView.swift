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
    var timings: String
    var priceRange: Int
    
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
                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1))
            .clipped()
            .shadow(radius: 4)
            .padding(.vertical, 5)
        }.sheet(isPresented: $isPresentingModal, content: {
            RestaurantModal(
                restaurantName: self.restaurantName,
                restaurantAddress: self.locationString,
                cuisineType: self.cuisineType,
                timings: self.timings,
                priceRange: self.priceRange,
                latitude: self.latitude,
                longitude: self.longitude)
        })
        
    }
}

struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(
            locationString: "Chick-Fil-A Avenue",
            restaurantName: "Chick-Fil-A",
            cuisineType: "Fast Food",
            timings: "All day every day",
            priceRange: 2,
            latitude: "34.3665750000",
            longitude: "-89.5193210000"
        )
    }
}
