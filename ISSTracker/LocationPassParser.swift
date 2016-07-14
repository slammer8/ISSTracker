//
//  LocationPassParser.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreLocation

/// Parsers a LocationPass response.
final class LocationPassParser: Parser {
    
    static func parse(dictionaryRepresentable: [String: AnyObject]) -> LocationPass? {
        
        guard let requestValue = dictionaryRepresentable["request"], responseValue = dictionaryRepresentable["response"] else {
            return nil
        }
        
        let requestJSON = JSON(requestValue)
        let responseJSON = JSON(responseValue)
        
        let timeStamp = NSDate(timeIntervalSince1970: requestJSON["datetime"].doubleValue)
        
        let latitude = requestJSON["latitude"].doubleValue
        let longitude = requestJSON["longitude"].doubleValue
        
        let location = CLLocationCoordinate2DMake(latitude, longitude)
        
        let passTimes: [PassTime] = responseJSON.flatMap { _, json in
            
            let duration = json["duration"].doubleValue as NSTimeInterval
            let riseTime = NSDate(timeIntervalSince1970: json["risetime"].doubleValue)
            
            return PassTime(duration: duration, riseTime: riseTime)
        }
        
        return LocationPass(location: location, timeStamp: timeStamp, passTimes: passTimes)
    }
}
