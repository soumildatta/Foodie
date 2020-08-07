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
    
    var restaurantName: String
    var restaurantAddress: String
    var cuisineType: String
    var timings: String
    var priceRange: Int
    
    var body: some View {
        VStack {
            MapView().frame(height: 400).edgesIgnoringSafeArea(.top)
            RestaurantModalInfo(restaurantName: restaurantName, restaurantAddress: restaurantAddress, cuisineType: cuisineType, timings: timings, priceRance: priceRange)
            Spacer()
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text(/*@START_MENU_TOKEN@*/"Done"/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(10)
                    .padding(.horizontal, 50)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("PastelBlue"), Color("Lavender")]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
            }.padding()
        }
    }
}

struct RestaurantModal_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantModal(restaurantName: "Item", restaurantAddress: "There", cuisineType: "Is", timings: "Something", priceRange: 2)
    }
}
