//
//  FavoriteLocationUpdater.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/15/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//


/// Makes a request for a favorite location and persists the result.
final class FavoriteLocationUpdater {
    
    private let updater = ModelObjectUpdater<SavedLocation>()
    
    /**
     Requests the next flyover time for a location.
     
     - parameter request:    The request to make.
     - parameter name:       The name to save with the request, if any.
     - parameter completion: The completion handler.
     */
    func requestSavedLocation(request: ISSRequest, name: String?, completion: (Result<SavedLocation> -> Void)){
        
        updater.performRequest(request, completion: completion)
    }

}
