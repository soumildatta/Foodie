//
//  SpinnerView.swift
//  Foodie
//
//  Created by Soumil Datta on 8/7/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import SwiftUI

struct SpinnerView: View {
    @State var spin = false
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.8)
                    .stroke(AngularGradient(gradient: .init(colors: [Color.blue, Color.green]), center: .center), style: StrokeStyle(lineWidth: 6, lineCap: .round))
                    .frame(width: 45, height: 45)
                    .rotationEffect(.init(degrees: self.spin ? 360 : 0))
                    .animation(Animation.linear(duration: 0.8).repeatForever(autoreverses: false))
                
                Circle()
                    .trim(from: 0.2, to: 0.7)
                    .stroke(AngularGradient(gradient: .init(colors: [Color.blue, Color.green]), center: .center), style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    .frame(width: 23, height: 23)
                    .rotationEffect(.init(degrees: self.spin ? 360 : 0))
                    .animation(Animation.linear(duration: 0.6).repeatForever(autoreverses: false))
                
                Circle()
                    .trim(from: 0.0, to: 0.7)
                    .stroke(AngularGradient(gradient: .init(colors: [Color.blue, Color.green]), center: .center), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .frame(width: 75, height: 75)
                    .rotationEffect(.init(degrees: self.spin ? 360 : 0))
                    .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
            }
        }.onAppear{
            self.spin.toggle()
        }
    }
}

struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
