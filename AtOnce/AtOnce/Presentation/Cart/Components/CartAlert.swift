//
//  CartAlert.swift
//  AtOnce
//
//  Created by mac on 01/07/2025.
//


enum CartAlert: Identifiable, Equatable {
    case message(String)
    case deleteConfirm(warehouseId: Int, itemId: Int, itemName: String)
    
    var id: String {
        switch self {
        case .message(let msg): return "message:\(msg)"
        case .deleteConfirm(_, let itemId, _): return "delete:\(itemId)"
        }
    }
}