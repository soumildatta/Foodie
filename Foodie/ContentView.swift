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
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Foodie")
                .font(.system(size: 50))
                .fontWeight(.bold)
            HStack {
                Spacer()
                Text("top restaurants near you".uppercased())
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                    .padding()
                Spacer()
            }
            List {
                Button(action: {
                    self.isPresentingModal.toggle()
                }) {
                    RestaurantCardView(locationString: "Oxford, MS", restaurantName: "Ajax Diner")
                }
            }
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
            .sheet(isPresented: $isPresentingModal, content: {
                RestaurantModal()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
