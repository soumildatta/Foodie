//
//  RestaurantCardView.swift
//  Foodie
//
//  Created by Soumil Datta on 8/3/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import SwiftUI

struct RestaurantCardView: View {
    
    var locationString: String
    var restaurantName: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(locationString)
                    .font(.subheadline).fontWeight(.semibold).foregroundColor(.secondary)
                Text(restaurantName)
                    .font(.title)
                    .fontWeight(.semibold)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1))
        .clipped()
        .shadow(radius: 4)
    }
}

struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(locationString: "Oxford, MS", restaurantName: "Chick-Fil-A")
    }
}
