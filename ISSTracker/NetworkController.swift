//
//  NetworkController.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import Alamofire

/// Peforms a network request and returns a response.
final class NetworkController {
    
    /*
     Peforms a network request the provided request
     
     parameters:
     - request: the request to perform.
     - completion: the completion block to call.
     
     returns: a response, if any
     
     */
    static func performRequest(request: Request, completion: (request: NSURLRequest?, response: NSHTTPURLResponse?, data: NSData?, error: NSError?) -> Void) {
        
        let urlRequest = NSMutableURLRequest(URL: request.absoluteURL)
        
        if !request.headers.isEmpty {
            for (key, value) in request.headers {
                urlRequest.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        urlRequest.HTTPMethod = request.method.rawValue
        
        let encoding = Alamofire.ParameterEncoding.URLEncodedInURL
        
        let (encodedRequest, _) = encoding.encode(urlRequest, parameters: request.parameters)
        
        Alamofire.request(encodedRequest)
            .validate()
            .response(completionHandler: completion)
    }
    
}