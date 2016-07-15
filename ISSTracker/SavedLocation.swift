//
//  SavedLocation.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import Foundation
import RealmSwift

/// Details a saved location with pass details.
final class SavedLocation: Object, Parseable {
    
    /// The name of the saved location.
    dynamic var name = ""
    
    /// The longitude of the location.
    let longitude = RealmOptional<Double>()
    
    /// The latitude fo the location.
    let latitude = RealmOptional<Double>()

    /// The time of the request.
    dynamic var timeStamp: NSDate? = nil
    
    /// Array of pass times.
    let passTimes = List<PassTime>()
    
}

extension SavedLocation {
    typealias ParserType = LocationPassParser
}
