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
    case addToCart(cartBody:CartBodyDTO)
    case deleteCartItem(pharmacyID: Int,warehouseId: Int,cartItemId:Int)
    
    var baseURL: String{
        "http://www.pharmaatoncepredeploy.somee.com/"
    }
    
    var path: String{
        switch self{
        case .getCartByPharmacyId(pharmacyId: let pharmacyId):
            "api/Cart/\(pharmacyId)"
        case .addToCart(cartBody: let cartBody):
            "api/Cart/add"
        case .deleteCartItem(pharmacyID: let pharmacyId, warehouseId: let warehouseId, cartItemId: let cartItemId):
            "api/Cart/remove-item?pharmacyId=\(pharmacyId)&warehouseId=\(warehouseId)&medicineId=\(cartItemId)"
        }
        
    }
    
    var method: HTTPMethod{
        switch self {
        case .getCartByPharmacyId(pharmacyId: _):
                .get
        case .addToCart(cartBody: let cartBody):
                .post
        case .deleteCartItem(pharmacyID: _, warehouseId: _, cartItemId: _):
                .delete
            
        }
    }
    
    var headers: [String : String]?{
        ["Content-Type": "application/json"]
    }
    
    var bodyAsDictionary: [String : Any]?{
        switch self{
        case.addToCart(cartBody: let cartBody):
            [
                "warehouseId": cartBody.warehouseId,
                "pharmacyId": cartBody.pharmacyId,
                "medicineId": cartBody.medicineId,
                "englishMedicineName": cartBody.englishMedicineName,
                "arabicMedicineName": cartBody.arabicMedicineName,
                "medicineUrl": cartBody.medicineUrl,
                "warehouseUrl": cartBody.warehouseUrl,
                "price": cartBody.price,
                "quantity": cartBody.quantity,
                "discount": cartBody.discount
            ]
        case.getCartByPharmacyId(pharmacyId: let pharamacyId):
            nil
        case .deleteCartItem(pharmacyID: let pharmacyID, warehouseId: let warehouseId, cartItemId: let cartItemId):
            nil
        }
    }
    
    
}

