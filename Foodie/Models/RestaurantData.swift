//
//  RestaurantData.swift
//  Foodie
//
//  Created by Soumil Datta on 8/6/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import Foundation

struct RestaurantResults: Decodable {
    let best_rated_restaurant: [RestaurantOuter]
}

struct RestaurantOuter: Decodable, Identifiable {
    var restaurant: Restaurant
    var id: String {
        return restaurant.id
    }
}

struct Restaurant: Decodable {
    var id: String
    var name: String
    var url: String
    var location: RestaurantLocation
    var cuisines: String
    var price_range: Int
    var user_rating: UserRating
    var phone_numbers: String
}

struct RestaurantLocation: Decodable {
    var address: String
    var latitude: String
    var longitude: String
}

struct UserRating: Decodable {
    var aggregate_rating: String
    var votes: Int
}
