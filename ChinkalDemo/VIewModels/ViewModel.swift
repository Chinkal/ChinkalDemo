//
//  ViewModel.swift
//  ChinkalDemo
//
//  Created by chinkalshah on 03/08/19.
//  Copyright © 2019 chinkalshah. All rights reserved.
//

import Foundation
import CoreLocation

struct AirportViewModel {

    var name :String!
    var city :String!
    var country :String!
    var runway_length :String!
    var lat :String!
    var long :String!
    var distance : Double?
    
    
    init(airport :Airport) {
        self.name = airport.name
        self.city = airport.city
        self.country = airport.country
        self.runway_length = airport.runway_length
        self.lat = airport.lat
        self.long = airport.lon
    }

    
}
