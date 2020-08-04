//
//  ContentView.swift
//  Foodie
//
//  Created by Soumil Datta on 8/3/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            RestaurantCardView()
            RestaurantCardView()
            RestaurantCardView()
            RestaurantCardView()
            RestaurantCardView()
            RestaurantCardView()
            RestaurantCardView()
            RestaurantCardView()
            RestaurantCardView()
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
