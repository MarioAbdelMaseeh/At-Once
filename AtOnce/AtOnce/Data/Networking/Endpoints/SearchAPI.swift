//
//  SearchAPI.swift
//  AtOnce
//
//  Created by mac on 22/06/2025.
//

import Alamofire

enum SearchAPI:APIRequest{
    case SearchByText(text: String, page: Int, pageSize: Int)
    
    var baseURL: String{
        "http://www.pharmaatoncepredeploy.somee.com/"
    }
    
    var path: String{
        switch self{
        case .SearchByText(text: let text, page: let page, pageSize: let pageSize):
            "api/Medicine/SearchNameByAreaPagination/2?page=\(page)&pageSize=\(pageSize)&search=\(text)"
        }
    }
    
    var method: HTTPMethod{
        .get
    }
    
    var headers: [String : String]?{
        ["Content-Type": "application/json"]
    }
    
    var bodyAsDictionary: [String : Any]?{
        nil
    }
    
    
}
