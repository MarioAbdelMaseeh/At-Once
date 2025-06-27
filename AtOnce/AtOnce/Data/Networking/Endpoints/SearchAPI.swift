//
//  SearchAPI.swift
//  AtOnce
//
//  Created by mac on 22/06/2025.
//

import Alamofire

enum SearchAPI:APIRequest{
    case SearchByText(area: Int, text: String, page: Int, pageSize: Int, type: String)
    
    var baseURL: String{
        Constants.baseURL
    }
    
    var path: String{
        switch self{
        case .SearchByText(area: let area, text: let text, page: let page, pageSize: let pageSize, type: let type):
            "api/Medicine/SearchNameByAreaPagination/\(area)?page=\(page)&pageSize=\(pageSize)&search=\(text)&type=\(type)"
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
