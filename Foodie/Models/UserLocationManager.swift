//
//  UserLocationManager.swift
//  Foodie
//
//  Created by Soumil Datta on 8/7/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import Foundation
import CoreLocation

class UserLocationManager: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    // - API
    public var exposedLocation: CLLocation? {
        return self.locationManager.location
    }
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
    }
}

// MARK: - Get location name
extension UserLocationManager {
    func getPlace(for location: CLLocation, completion: @escaping (CLPlacemark?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if error == nil {
                guard let placemark = placemarks?[0] else {
                    completion(nil)
                    return
                }
                
                completion(placemark)
            } else {
                completion(nil)
                return
            }
        }
    }
}
