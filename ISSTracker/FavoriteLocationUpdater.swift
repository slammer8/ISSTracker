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
    private let persistenceController = PersistenceController()
    
    func requestSavedLocation(request: ISSRequest, completion: (Result<SavedLocation> -> Void)){
        
        updater.performRequest(request) { [weak self] result in
            
            // Don't persist if we don't have self
            guard let strongSelf = self else { return }
            
            switch result {
            case let .Success(result: result):
                strongSelf.persistenceController.persistObject(result)
            case .Failure:
                assertionFailure("error completing request")
            }
        }
    }

}
