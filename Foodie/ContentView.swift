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
                    RestaurantCardView(locationString: "Oxford, MS", restaurantName: "Toyo")
                }
            }
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
            .sheet(isPresented: $isPresentingModal, content: {
                Text("Presenting Modal")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
