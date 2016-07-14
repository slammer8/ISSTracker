//
//  CurrentISSPositionParser.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreLocation

/// Parsers a CurrentISSPosition response.
final class CurrentISSPositionParser: Parser {
    
    static func parse(dictionaryRepresentable: [String: AnyObject]) -> CurrentISSPosition? {
        
        guard let positionJSON = dictionaryRepresentable["iss_position"] as? JSON, unixTime = dictionaryRepresentable["timestamp"] as? Double else {
            return nil
        }
        
        let timeStamp = NSDate(timeIntervalSince1970: unixTime)
        
        let latitude = positionJSON["latitude"].doubleValue
        let longitude = positionJSON["longitude"].doubleValue
        
        let location = CLLocationCoordinate2DMake(latitude, longitude)
        
        return CurrentISSPosition(timeStamp: timeStamp, currentPosition: location)
    }
}
