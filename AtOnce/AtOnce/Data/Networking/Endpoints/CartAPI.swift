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
    case updateCartItem(pharmacyID: Int, warehouseId: Int, medicineId: Int, quantity: Int)
    case placeOrder(pharmacyId: Int, warehouseId: Int)
    var baseURL: String{
        "http://www.pharmaatoncepredeploy.somee.com/"
    }
    
    var path: String{
        switch self{
        case .getCartByPharmacyId(pharmacyId: let pharmacyId):
            "api/Cart/\(pharmacyId)"
        case .addToCart(cartBody: _):
            "api/Cart/add"
        case .deleteCartItem(pharmacyID: let pharmacyId, warehouseId: let warehouseId, cartItemId: let cartItemId):
            "api/Cart/remove-item?pharmacyId=\(pharmacyId)&warehouseId=\(warehouseId)&medicineId=\(cartItemId)"
        case .updateCartItem(pharmacyID: let pharmacyId, warehouseId: let warehouseId, medicineId: let medicineId, quantity: let quantity):
            "api/Cart/update-quantity?pharmacyId=\(pharmacyId)&warehouseId=\(warehouseId)&medicineId=\(medicineId)&newQuantity=\(quantity)"
        case .placeOrder(pharmacyId: let pharmacyId, warehouseId: let warehouseId):
            "api/Cart/place-order?pharmacyId=\(pharmacyId)&warehouseId=\(warehouseId)"
        }
        
    }
    
    var method: HTTPMethod{
        switch self {
        case .getCartByPharmacyId(pharmacyId: _):
                .get
        case .addToCart(cartBody: _):
                .post
        case .deleteCartItem(pharmacyID: _, warehouseId: _, cartItemId: _):
                .delete
        case .updateCartItem(pharmacyID: _, warehouseId: _, medicineId: _, quantity: _):
                .put
        case .placeOrder(pharmacyId: _, warehouseId: _):
                .post
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
        case.getCartByPharmacyId(pharmacyId: _):
            nil
        case .deleteCartItem(pharmacyID: _, warehouseId: _, cartItemId: _):
            nil
        case .updateCartItem(pharmacyID: _, warehouseId: _, medicineId: _, quantity: _):
            nil
        case .placeOrder(pharmacyId: _, warehouseId: _):
            nil
        }
    }
}

