//
//  ProductAPI.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 21/06/2025.
//
import Alamofire

enum ProductAPI: APIRequest{
    
    case getProductsByWarehouse(warehouseId: Int, page: Int, pageSize: Int)
    case getSuppliersByProduct(areaId: Int,productId: Int)
    var baseURL: String{
      //  "http://predeploypharmaatonceafteredit.somee.com/"
        "http://www.pharmaatoncepredeploy.somee.com/"
    }
    
    var path: String{
        switch self{
        case .getProductsByWarehouse(warehouseId: let warehouseId, page: let page, pageSize: let pageSize):
           return "api/Warehouse/GetWarehousMedicines/\(warehouseId)/medicines?page=\(page)&pageSize=\(pageSize)"
        case .getSuppliersByProduct(areaId: let areaId, productId: let productId):
            return "api/warehouse/area/\(areaId)/medicine/\(productId)"
            
        }
    }
    
    var method: HTTPMethod{
        switch self {
        case .getProductsByWarehouse(warehouseId: _, page: _, pageSize: _):
             return   .get
        case .getSuppliersByProduct(areaId: _, productId: _):
            return   .get
            
        }
    }
    
    var headers: [String : String]?{
        ["Content-Type": "application/json"]
    }
    
    var bodyAsDictionary: [String : Any]?{
        nil
    }
}
