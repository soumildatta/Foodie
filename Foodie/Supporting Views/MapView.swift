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
    let locationManager = CLLocationManager()
    
    // for annotation
    var title: String
    var locationName: String
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: (latitude as NSString).doubleValue,
            longitude: (longitude as NSString).doubleValue
        )

        uiView.showsUserLocation = true
        let status = CLLocationManager.authorizationStatus()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
//            let location: CLLocationCoordinate2D = locationManager.location!.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            uiView.setRegion(region, animated: true)
            
            let restaurant = RestaurantAnnotation(
                title: title,
                locationName: locationName,
                coordinate: coordinate
            )

            uiView.addAnnotation(restaurant)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: "34.3665750000", longitude: "-89.5193210000", title: "Ajax Diner", locationName: "Oxford, Mississippi")
    }
}
