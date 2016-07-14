//
//  CurrentISSPosition.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import Foundation
import CoreLocation

final class CurrentISSPosition: Parseable {
    
    /// The time of the request.
    let timeStamp: NSDate
    
    /// The current position.
    let currentPosition: CLLocationCoordinate2D
    
    /**
     Returns a CurrentISSPosition.
     
     - parameter timeStamp:       The time of the request.
     - parameter currentPosition: The current position of the ISS.
     
     - returns: An initalized CurrentISSPosition.
     */
    init(timeStamp: NSDate, currentPosition: CLLocationCoordinate2D) {
        self.timeStamp = timeStamp
        self.currentPosition = currentPosition
    }

}

extension CurrentISSPosition {
    typealias ParserType = CurrentISSPositionParser
}
