//
//  Networking.swift
//  Foodie
//
//  Created by Soumil Datta on 8/6/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    var location = [Location]()
    @Published var restaurants = [RestaurantOuter]()
    
    func fetchRestaurantData() {
        // first, get entity id from zomato location api
        if let url = URL(string: "https://developers.zomato.com/api/v2.1/locations?apikey=\(Keys.apiKey)&query=Oxford%2C%20Mississippi") {
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if error == nil {
                    if let safeData = data {
                        let results = try! JSONDecoder().decode(LocationResults.self, from: safeData)
                        DispatchQueue.main.async {
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
                }
            }.resume()
        }
    }
}
