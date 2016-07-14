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
    
    /**
     Performs a network request with a provided request.
     
     - parameter request:    The request to perform.
     - parameter completion: The completion handler to return after the request completes.
     */
    static func performRequest(request: Request, completion: (Result<[String: AnyObject]>) -> Void) {
        
        let urlRequest = NSMutableURLRequest(URL: request.absoluteURL)
        
        urlRequest.HTTPMethod = request.method.rawValue
        
        let encoding = Alamofire.ParameterEncoding.URLEncodedInURL
        
        let (encodedRequest, _) = encoding.encode(urlRequest, parameters: request.parameters)
        
        Alamofire.request(encodedRequest)
            .validate()
            .responseJSON { response in
                
                if let error = response.result.error {
                    completion(.Failure(error: error))
                }
                
                guard let value = response.result.value as? [String: AnyObject] else {
                    let error = NSError(domain: "Expected JSON Error", code: -2, userInfo: nil)
                    completion(.Failure(error: error))
                    return
                }
                completion(.Success(result: value))
        }
    }
    
}
