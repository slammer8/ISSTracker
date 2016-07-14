//
//  ModelObjectUpdater.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import SwiftyJSON

/// Peforms a network request and parses the response.
final class ModelObjectUpdater<T:Parseable> {
    
    /**
     Performs a network request with a Request object.
     
     - parameter request:    The request to perform.
     - parameter completion: The completion with the parsed object, if any.
     */
    func performRequest(request: Request, completion: (Result<T.ParserType.ParsedObject>) -> Void) {
        
        NetworkController.performRequest(request) { (NSURLRequest, response, data, error) in
            
            if let error = error {
                completion(Result.failure(error: error))
            }
            
            guard let object = T.ParserType.parse(data, request: request) else {
                
                let error = NSError(domain: "Parsing error", code: -1, userInfo: nil)
                completion(Result.failure(error: error))
                return
            }
            
            completion(Result.success(result: object))
        }
    }
    
}
