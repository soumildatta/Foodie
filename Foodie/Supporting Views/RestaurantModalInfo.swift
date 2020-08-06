//
//  RestaurantModalInfo.swift
//  Foodie
//
//  Created by Soumil Datta on 8/4/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import SwiftUI

struct RestaurantModalInfo: View {
    var body: some View {
        VStack {
            Text("Ajax Diner")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("118 Courthouse Sq, Oxford 38655")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            
            VStack {
                HStack {
                    Text("Cuisine: ")
                        .fontWeight(.medium)
                    Spacer()
                    Text("Burger, Diner, Southern")
                }.padding([.top, .horizontal])
                HStack {
                    Text("Timings: ")
                        .fontWeight(.medium)
                    Spacer()
                    Text("7 AM to 1:30 PM (Mon-Fri),8 AM to 3 PM (Sat-Sun)")
                        .font(.system(size: 14))
                        .multilineTextAlignment(.trailing)
                        .padding(.leading)
                }.padding([.top, .horizontal])
                HStack {
                    Text("Pricing: ")
                        .fontWeight(.medium)
                    Spacer()
                    Text("$$$")
                        .foregroundColor(.green)
                }.padding([.top, .horizontal])
            }.padding()
            Spacer()
            
        }
    }
}

struct RestaurantModalInfo_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantModalInfo()
    }
}
