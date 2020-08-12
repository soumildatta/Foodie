//
//  RestaurantModalInfo.swift
//  Foodie
//
//  Created by Soumil Datta on 8/4/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import SwiftUI

struct RestaurantModalInfo: View {
    var restaurantName: String
    var restaurantAddress: String
    var cuisineType: String
    var priceRance: Int
    var rating: String
    var numOfVotes: Int
    var phoneNumber: String
    
    var body: some View {
        VStack {
            Text(restaurantName)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(restaurantAddress)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            
            Text("Customer Rating")
                .fontWeight(.semibold)
                .font(.system(size: 19))
                .padding(.top, 8)
            Text(rating)
                .font(.system(size: 30))
                .foregroundColor(Color(red: 0, green: 0.6275, blue: 0.0196))
            Text("\(String(numOfVotes)) votes").font(.system(size: 14)).fontWeight(.semibold).foregroundColor(.secondary)
            
            VStack {
                HStack {
                    Text("Cuisine: ")
                        .fontWeight(.medium)
                    Spacer()
                    Text(cuisineType)
                }.padding(.horizontal)
                HStack {
                    Text("Pricing: ")
                        .fontWeight(.medium)
                    Spacer()
                    Text(String(repeating: "$", count: priceRance))
                        .foregroundColor(Color(red: 0, green: 0.6275, blue: 0.0196))
                }.padding([.top, .horizontal])
                HStack {
                    Text("Phone Number: ")
                        .fontWeight(.medium)
                    Spacer()
                    // get the first available phone number by splitting string by comma
                    Text(phoneNumber.components(separatedBy: ", ")[0])
                }.padding([.top, .horizontal])
            }.padding()
            Spacer()
            
        }
    }
}

struct RestaurantModalInfo_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantModalInfo(restaurantName: "Ajax Diner", restaurantAddress: "118 Courthouse Sq, Oxford 38655", cuisineType: "Burger, Diner, Southern", priceRance: 2, rating: "3.5", numOfVotes: 18, phoneNumber: "(xxx) xxx xxxx")
    }
}
