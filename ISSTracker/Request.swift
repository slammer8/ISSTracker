//
//  Request.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import Alamofire

/// A protocol for network requests.
protocol Request {
    
    /// The base url of the request.
    var baseURL: String { get }
    
    /// The path of the request.
    var path: String { get }
    
    /// The method of the request.
    var method: Alamofire.Method { get }
    
    /// The parameters to pass.
    var parameters: [String: NSObject] { get }
    
    /// The request headers.
    var headers: [String: String] { get }
}

/// Default implementations
extension Request {
    
    var method: Alamofire.Method {
        return .GET
    }
    
    var absoluteURL: NSURL {
        return NSURL(string: baseURL + path)!
    }
    
    var headers: [String: String] {
        return [:]
    }
    
}
