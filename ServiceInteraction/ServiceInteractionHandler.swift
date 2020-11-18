//
//  ServiceInteraction.swift
//  iOS Starter
//
//  Created by Sagaya Navis Vijay on 28/09/20.
//  Copyright © 2020 sysaxiom. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Service Interaction - Generic
publci class ServiceInteractionHandler {
    
    static public func apiCall(urlString:String,httpMethod:APIMethod,foregroundAPICall:Bool,parameters:Dictionary<String, String>?,completionBlock: @escaping (Data) -> Void) -> Void
    {
        
        
        if !Reachability.isInternetAvailable() {
            return
        }
        
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = httpMethod.description
        
        //Passing Parameter
        if httpMethod != .GET {
            if let param = parameters {
                request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
            } else {
                print("Pass body parameter")
            }
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.setValue(Constants.URLS.HEADER_VALUE, forHTTPHeaderField: Constants.URLS.HEADER_KEY)
        
        //API Time Out
        let session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = 30
        session.configuration.timeoutIntervalForResource = 30
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            guard let responseData = data else {
                return
            }
            completionBlock(responseData)
            
        })
        task.resume()
    }
    static public func apiCall(urlString:String,httpMethod:APIMethod,foregroundAPICall:Bool,parameters:Dictionary<String, String>?,completionBlock: @escaping (Data?,URLResponse?,Error?) -> Void) -> Void
    {
        
        
        if !Reachability.isInternetAvailable() {
            return
        }
        
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = httpMethod.description
        
        //Passing Parameter
        if httpMethod != .GET {
            if let param = parameters {
                request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
            } else {
                print("Pass body parameter")
            }
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.setValue(Constants.URLS.HEADER_VALUE, forHTTPHeaderField: Constants.URLS.HEADER_KEY)
        
        //API Time Out
        let session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = 30
        session.configuration.timeoutIntervalForResource = 30
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            completionBlock(data,response,error)
        })
        task.resume()
    }
    
}


//MARK: - HTTP Methoda
public enum APIMethod {
    
    case GET
    case POST
    case PUT
    case DELETE
    
    var description : String {
     
        switch self {
      
      case .GET: return "GET"
      case .POST: return "POST"
      case .PUT: return "PUT"
      case .DELETE: return "DELETE"
      }
        
    }
    
}




