//
//  RestaurantDetailWebView.swift
//  Foodie
//
//  Created by Soumil Datta on 8/10/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import SwiftUI

struct RestaurantDetailWebView: View {
    let url: String?
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Back").foregroundColor(Color.white)
                }.padding(4).background(Color.blue).cornerRadius(5).padding([.leading, .top])
                Spacer()
            }
            
            WebView(url: url)
        }
    }
}

struct RestaurantDetailWebView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailWebView(url: "https://www.google.com")
    }
}
