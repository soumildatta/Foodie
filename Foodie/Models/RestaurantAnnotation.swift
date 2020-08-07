//
//  RestaurantAnnotation.swift
//  Foodie
//
//  Created by Soumil Datta on 8/7/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import Foundation
import MapKit

class RestaurantAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let coordinate: CLLocationCoordinate2D
    
    init(
        title: String?,
        locationName: String?,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
