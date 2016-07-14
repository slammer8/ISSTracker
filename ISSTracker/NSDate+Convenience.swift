//
//  NSDate+Convenience.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import Foundation

extension NSDate {
    
    /* Converts a Date object to a string representation.
     
     parameters:
     - format: The format requested using Unicode TR35-31.
     - formatter: An optional instance of DateFormatter.
     
     returns: A date string with the requested format.
     */
    func convertToLocaleUsingDateFormat(format: String, locale: NSLocale = NSLocale.currentLocale(), formatter: NSDateFormatter = NSDateFormatter() ) -> String {
        formatter.dateFormat = format
        formatter.locale = locale
        return formatter.stringFromDate(self)
    }

}