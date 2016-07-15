//
//  LocationPassParser.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import Foundation
import SwiftyJSON

/// Parses a SavedLocation response.
final class LocationPassParser: Parser {
    
    static func parse(dictionaryRepresentable: [String: AnyObject]) -> SavedLocation? {
        
        guard let requestValue = dictionaryRepresentable["request"], responseValue = dictionaryRepresentable["response"] else {
            return nil
        }
        
        let requestJSON = JSON(requestValue)
        let responseJSON = JSON(responseValue)
        
        let savedLocation = SavedLocation()
        
        savedLocation.timeStamp = NSDate(timeIntervalSince1970: requestJSON["datetime"].doubleValue)
        
        savedLocation.latitude.value = requestJSON["latitude"].doubleValue
        savedLocation.longitude.value = requestJSON["longitude"].doubleValue
        
        let passTimes: [PassTime] = responseJSON.flatMap { _, json in
            
            let passTime = PassTime()

            passTime.duration = json["duration"].doubleValue as NSTimeInterval
            passTime.riseTime = NSDate(timeIntervalSince1970: json["risetime"].doubleValue)
            
            return passTime
        }
        
        savedLocation.passTimes.appendContentsOf(passTimes)

        return savedLocation
    }
}
