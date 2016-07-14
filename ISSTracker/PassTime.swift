//
//  PassTime.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import Foundation

/// Represents a single ISS pass time.
final class PassTime {
    
    /// The duration of the pass.
    let duration: NSTimeInterval
    
    /// The beginning time of the pass.
    let riseTime: NSDate
    
    /**
     Initializes a PassTime.
     
     - parameter duration: The duration of the pass.
     - parameter riseTime: The beginning time fo the pass.
    
     - returns: A initalized PassTime.
     */
    init(duration: NSTimeInterval, riseTime: NSDate) {
        self.duration = duration
        self.riseTime = riseTime
    }
}
