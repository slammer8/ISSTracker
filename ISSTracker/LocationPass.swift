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
final class LocationPass {
    
    /// The location requested.
    let location: CLLocationCoordinate2D
    
    /// The time of the apperance.
    let riseTime: NSDate
    
    /// The duration of the pass.
    let duration: NSTimeInterval
    
    /**
     Initializes a LocationPass.
     
     - parameter location: The location in the request.
     - parameter riseTime: The time when the object will appear.
     - parameter duration: The duration of the ISS.
     
     - returns: An initialized LocationPass.
     */
    init(location: CLLocationCoordinate2D, riseTime: NSDate, duration: NSTimeInterval) {
        self.location = location
        self.riseTime = riseTime
        self.duration = duration
    }
}
