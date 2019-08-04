//
//  Airport.swift
//  ChinkalDemo
//
//  Created by chinkalshah on 03/08/19.
//  Copyright © 2019 chinkalshah. All rights reserved.
//

import UIKit
import CoreLocation

class Airport {
    private enum CodingKeys: String, CodingKey {
        case name
        case city
        case state
        case country
        case lat
        case lon
        case code
        case woeid
        case tz
        case phone
        case type
        case email
        case runway_lengthurl
        case elev
        case icao
        case direct_flights
        case carriers
    }

    var name :String!
    var city :String!
    var state :String!
    var country :String!
    var lat :String!
    var lon :String!
    var code :String!
    var woeid :String!
    var tz :String!
    var phone :String!
    var type :String!
    var email :String!
    var url :String!
    var runway_length :String!
    var elev :String!
    var icao :String!
    var direct_flights :String!
    var carriers :String!

    var distance: Int64?
    var location :CLLocation!

    //MARK: Init
    ///initializes Model
    init?(dictionary :NSDictionary) {
        let name = dictionary["name"] as? String
        let city = dictionary["city"] as? String
        let country = dictionary["country"] as? String
        let lat = dictionary["lat"] as? String
        let lon = dictionary["lon"] as? String
        let code = dictionary["code"] as? String
        let woeid = dictionary["woeid"] as? String
        let tz = dictionary["tz"] as? String
        let phone = dictionary["phone"] as? String
        let type = dictionary["type"] as? String
        let email = dictionary["email"] as? String
        let icao = dictionary["icao"] as? String
        let direct_flights = dictionary["direct_flights"] as? String
        let carriers = dictionary["carriers"] as? String
        let runway_length = dictionary["runway_length"] as? String


        self.name = name
        self.city = city
        self.country = country
        self.lat = lat
        self.lon = lon
        self.code = code
        self.city = city
        self.woeid = woeid
        self.tz = tz
        self.phone = phone
        self.type = type
        self.email = email
        self.icao = icao
        self.direct_flights = direct_flights
        self.carriers = carriers
        self.runway_length = runway_length
        self.location = CLLocation(latitude: (Double(self.lat))! ,  longitude: (Double(self.lon))!)

    }
    
    init(viewModel :AirportViewModel) {
        self.city = viewModel.city
        self.country = viewModel.country
        self.runway_length = viewModel.runway_length
    }
    
    public func Getdistance(to location: CLLocation) {
        self.distance = Int64 (self.location.distance(from: location))
    }

}
