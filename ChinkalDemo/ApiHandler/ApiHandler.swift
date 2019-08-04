//
//  ApiHandler.swift
//  ChinkalDemo
//
//  Created by chinkalshah on 03/08/19.
//  Copyright © 2019 chinkalshah. All rights reserved.
//

import UIKit
typealias JSONDictionary = [String:String]

class ApiHandler: NSObject {
    
    enum requestType: UInt {
        case getAirportJsonData
    }
    
    // MARK: - downloadAirportLlist Api
    public class func downloadAirportLlist(_ requestType : UInt , httpmethod : String , andPostparameters : String , Delegate : DataDownloadCompletionDelegate)  {
        URLSession.shared.dataTask(with: URL(string: "https://gist.githubusercontent.com/tdreyno/4278655/raw/7b0762c09b519f40397e4c3e100b097d861f5588/airports.json")!) { (data, response, error) -> Void in
                Delegate.dataDownloadCompleted(error: error, data: data!)
            }.resume()
    }
    

}
