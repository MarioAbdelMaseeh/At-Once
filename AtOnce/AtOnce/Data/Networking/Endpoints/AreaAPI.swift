//
//  AreaAPI.swift
//  AtOnce
//
//  Created by Adham Mohamed on 23/06/2025.
//

import Foundation
import Alamofire

enum AreaAPI: APIRequest{
    case getAllAreasByGovernorateId(governorateId:Int)
    
    var baseURL: String{
        "http://www.pharmaatoncepredeploy.somee.com/"
    }
    
    var path: String{
        switch self{
            
        case .getAllAreasByGovernorateId(governorateId: let governorateId):
            "api/Pharmacy/register?governateId=\(governorateId)"
        }
    }
    
    var method: HTTPMethod{
        switch self {
        case .getAllAreasByGovernorateId(governorateId: _):
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
