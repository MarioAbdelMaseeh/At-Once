//
//  Warehouse.swift
//  At Once
//
//  Created by mac on 21/06/2025.
//
import Alamofire
enum WarehouseAPI: APIRequest{
    case getWarehousesByArea(areaId: Int, page: Int, pageSize: Int)
    var baseURL: String{
        Constants.baseURL
    }
    
    var path: String{
        switch self{
            
        case .getWarehousesByArea(areaId: let areaId, page: let page, pageSize: let pageSize):
            "api/Warehouse/GetWarehousesByArea/\(areaId)?page=\(page)&pageSize=\(pageSize)"
        }
    }
    
    var method: HTTPMethod{
        switch self {
        case .getWarehousesByArea(areaId: _, page: _, pageSize: _):
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
