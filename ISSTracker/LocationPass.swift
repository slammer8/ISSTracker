//
//  LocationPass.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import CoreLocation
import Foundation

/// Details a returned location pass for specified location.
final class LocationPass: Parseable {
    
    /// The location requested.
    let location: CLLocationCoordinate2D
    
    /// The time of the request.
    let timeStamp: NSDate
    
    /// Array of pass times.
    let passTimes: [PassTime]
    
    /**
     Initializes a LocationPass.
     
     - parameter location: The location in the request.
     - parameter requestTime: The time of the request.
     - parameter passTimes: The array of PassTime objects.
     
     - returns: An initialized LocationPass.
     */
    init(location: CLLocationCoordinate2D, timeStamp: NSDate, passTimes: [PassTime]) {
        self.location = location
        self.timeStamp = timeStamp
        self.passTimes = passTimes
    }
}

extension LocationPass {
    typealias ParserType = LocationPassParser
}
