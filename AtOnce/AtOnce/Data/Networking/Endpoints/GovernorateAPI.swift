//
//  GovernorateAPI.swift
//  AtOnce
//
//  Created by Adham Mohamed on 23/06/2025.
//

import Foundation
import Alamofire

enum GovernorateAPI: APIRequest{
    case getAllGovernorates
    
    var baseURL: String{
        "http://www.pharmaatoncepredeploy.somee.com/"
    }
    
    var path: String{
        switch self{
            
        case .getAllGovernorates:
            "api/Pharmacy/register"
        }
    }
    
    var method: HTTPMethod{
        switch self {
        case .getAllGovernorates:
                .get
        }
    }
    
    var headers: [String : String]?{
        ["Content-Type": "application/json"]
    }
    
    var bodyAsDictionary: [String : Any]?{
        nil
    }
    
    
}
