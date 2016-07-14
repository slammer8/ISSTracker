//
//  ISSRequest.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import CoreLocation

/// Requests related to the location of the ISS.
enum ISSRequest: Request {
    
    /// When the ISS will pass over a certain location.
    case LocationPassTime(location: CLLocationCoordinate2D)
    
    /// The current location of the ISS.
    case CurrentLocation
    
    var baseURL: String {
        return "http://api.open-notify.org"
    }
    
    var path: String {
        switch self {
        case .LocationPassTime:
            return "/iss-pass.json"
        case .CurrentLocation:
            return "/iss-now.json"
        }
    }
    
    var parameters: [String : NSObject] {
        switch self {
        case let .LocationPassTime(location):
            return ["lat": location.latitude,
                "lon": location.longitude]
        case .CurrentLocation:
            return [:]
        }
    }

}

