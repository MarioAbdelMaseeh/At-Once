//
//  ProductAPI.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 21/06/2025.
//
import Alamofire

enum ProductAPI: APIRequest{
    
    case getProductsByWarehouse(warehouseId: Int, page: Int, pageSize: Int)
    var baseURL: String{
      //  "http://predeploypharmaatonceafteredit.somee.com/"
        "http://www.pharmaatoncepredeploy.somee.com/"
    }
    
    var path: String{
        switch self{
        case .getProductsByWarehouse(warehouseId: let warehouseId, page: let page, pageSize: let pageSize):
            "api/Warehouse/GetWarehousMedicines/\(warehouseId)/medicines?page=\(page)&pageSize=\(pageSize)"
            
        }
    }
    
    var method: HTTPMethod{
        switch self {
        case .getProductsByWarehouse(warehouseId: _, page: _, pageSize: _):
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
