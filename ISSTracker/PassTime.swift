//
//  PassTime.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import RealmSwift

/// Represents a single ISS pass time.
final class PassTime: Object {
    
    /// The duration of the pass.
    dynamic var duration: Double = 0.0
    
    /// The rise time.
    dynamic var riseTime = NSDate()
}
