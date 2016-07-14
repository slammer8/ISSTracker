//
//  Parseable.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import Foundation

/// A protocol for objects that are parseable.
protocol Parseable {
    /// The parser type to use to parse the object.
    associatedtype ParserType: Parser
}

/// A protocol for parsers.
protocol Parser {
    /// The parsed object must be parseable.
    associatedtype ParsedObject = Parseable
    
    /// Required parser function.
    static func parse(data: NSData?, request: Request?) -> ParsedObject?
}
