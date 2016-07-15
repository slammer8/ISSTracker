//
//  MapUpdater.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/15/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import Foundation

final class MapUpdater {
    
    private let updater = ModelObjectUpdater<CurrentISSPosition>()

    /**
     Request the current position of the ISS.
     
     - parameter completion: the response, if any.
     */
    func requestCurrentPosition(completion: (Result<CurrentISSPosition> -> Void)){
        
        let request = ISSRequest.CurrentLocation
        
        updater.performRequest(request, completion: completion)
    }

}