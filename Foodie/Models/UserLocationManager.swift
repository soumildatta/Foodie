//
//  UserLocationManager.swift
//  Foodie
//
//  Created by Soumil Datta on 8/7/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import Foundation
import CoreLocation

struct UserLocationManager {
    let locationManager = CLLocationManager()
    
    func getLocationCoordinates() -> CLLocationCoordinate2D {
        let status = CLLocationManager.authorizationStatus()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        var location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 50.0, longitude: 50.0)
        
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            
            location = locationManager.location!.coordinate
            
        }
        
        return location
    }
}
