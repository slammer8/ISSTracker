//
//  PersistenceController.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/15/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import RealmSwift

/// The local persistence store
final class PersistenceController {
    
    let store = try! Realm()
    
    func persistObject(object: Object) {
        do {
            try store.write {
                store.add(object)
            }
        } catch {
            assertionFailure("Error saving object")
        }
    }
    
    func deleteObject(object: Object) {
        do {
            try store.write {
                store.delete(object)
            }
        } catch {
            assertionFailure("Error deleting object")
        }
    }
    
}
