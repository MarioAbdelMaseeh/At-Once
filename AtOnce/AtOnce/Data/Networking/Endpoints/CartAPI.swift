//
//  CartAPI.swift
//  AtOnce
//
//  Created by Adham Mohamed on 24/06/2025.
//

import Foundation
import Alamofire

enum CartAPI: APIRequest{
    case getCartByPharmacyId(pharmacyId:Int)
    
    var baseURL: String{
        "http://www.pharmaatoncepredeploy.somee.com/"
    }
    
    var path: String{
        switch self{
            
        case .getCartByPharmacyId(pharmacyId: let pharmacyId):
            "api/Cart/\(pharmacyId)"
        }
    }
    
    var method: HTTPMethod{
        switch self {
        case .getCartByPharmacyId(pharmacyId: _):
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

