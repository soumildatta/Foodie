//
//  Networking.swift
//  Foodie
//
//  Created by Soumil Datta on 8/6/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import Foundation
import CoreLocation

class NetworkManager: ObservableObject {
    var location = [Location]()
    @Published var exposedLocationTrue = true
    @Published var placemarkString = ""
    @Published var restaurants = [RestaurantOuter]()
    
    // for user coordinates
    let locationManager = UserLocationManager()
    
    func fetchRestaurantData() {
        
        guard let exposedLocation = locationManager.exposedLocation else {
            print("*** Error in \(#function): exposedLocation is nil")
            exposedLocationTrue = false
            print(exposedLocationTrue)
            return
        }
        
        // get city and state name for zomato api
        locationManager.getPlace(for: exposedLocation) { placemark in
            guard let placemark = placemark else { return }
            
            if let town = placemark.locality {
                if let state = placemark.administrativeArea {
                    self.placemarkString = "\(town), \(state)"
                    
                    let latitude = placemark.location?.coordinate.latitude
                    let longitude = placemark.location?.coordinate.longitude
                    
                    self.fetchData(latitude!, longitude!, town, state)
                }
            }
        }
    }
}

// MARK: - API Work
extension NetworkManager {
    func fetchData(_ latitude: CLLocationDegrees, _ longitude: CLLocationDegrees, _ town: String, _ state: String) {
        // conduct api work
        // first, get entity id from zomato location api
        if let url = URL(string: "https://developers.zomato.com/api/v2.1/locations?apikey=\(Keys.apiKey)&query=\(town)%2C%20\(state)&lat=\(latitude)&lon=\(longitude)") {
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if error == nil {
                    if let safeData = data {
                        let results = try! JSONDecoder().decode(LocationResults.self, from: safeData)
                        
                        self.location = results.location_suggestions
                        
                        // get restaurant data after getting entity id and type from zomato location api
                        if let restaurantUrl = URL(string: "https://developers.zomato.com/api/v2.1/location_details?apikey=\(Keys.apiKey)&entity_id=\(self.location[0].entity_id)&entity_type=\(self.location[0].entity_type)") {
                            URLSession.shared.dataTask(with: restaurantUrl) { (data, _, error) in
                                if error == nil {
                                    if let safeData = data {
                                        let results = try! JSONDecoder().decode(RestaurantResults.self, from: safeData)
                                        DispatchQueue.main.async {
                                            self.restaurants = results.best_rated_restaurant
                                        }
                                    }
                                }
                            }.resume()
                        }
                    }
                }
            }.resume()
        }
    }
}
