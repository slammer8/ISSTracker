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
    
    func requestSavedLocation(request: ISSRequest, name: String?, completion: (Result<SavedLocation> -> Void)){
        
        updater.performRequest(request) { [weak self] result in
            
            // Don't persist if we don't have self
            guard let strongSelf = self else { return }
            
            switch result {
            case let .Success(result: result):
                
                if let name = name where !name.isEmpty {
                    result.name = name
                }
                
                strongSelf.persistenceController.persistObject(result)
                
            case let .Failure(error: error):
                print("error \(error)")
            }
        }
    }

}
