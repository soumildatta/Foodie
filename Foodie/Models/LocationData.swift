//
//  LocationData.swift
//  Foodie
//
//  Created by Soumil Datta on 8/6/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import Foundation

struct LocationResults: Decodable {
    let location_suggestions: [Location]
}

struct Location: Decodable, Identifiable {
    var id: Int {
        return entity_id
    }
    var entity_type: String
    var entity_id: Int
}
