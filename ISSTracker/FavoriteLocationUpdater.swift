//
//  FavoriteLocationUpdater.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/15/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//


/// Makes a request for a favorite location
final class FavoriteLocationUpdater {
    
    let updater = ModelObjectUpdater<SavedLocation>()
    
    func requestSavedLocation(request: ISSRequest, completion: (Result<SavedLocation> -> Void)){
        
        updater.performRequest(request) { result in
            completion(result)
        }
    }

}
