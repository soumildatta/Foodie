//
//  MapView.swift
//  Foodie
//
//  Created by Soumil Datta on 8/4/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var latitude: String
    var longitude: String
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: (latitude as NSString).doubleValue,
            longitude: (longitude as NSString).doubleValue
        )
        let span = MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: "34.3665750000", longitude: "-89.5193210000")
    }
}
