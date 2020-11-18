//
//  ViewController.swift
//  ServiceInteraction-Example
//
//  Created by Sagaya Navis Vijay on 18/11/20.
//  Copyright © 2020 vijay. All rights reserved.
//

import UIKit
import ServiceInteraction

//MARK: - View Controller - Initialisation
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getAPICall()
    }


}

//MARK: - Get API CAll
extension ViewController  {

    func getAPICall() {
        
        let urlString = "https://reqres.in/api/users"
        let urlwithParameters = urlString + "?page=2"
        
        ServiceInteraction.apiCall(urlString: urlwithParameters, httpMethod: .GET, foregroundAPICall: true, parameters: nil) { (responseData) in
            
            print(responseData)
            
        }
        
    }

}
