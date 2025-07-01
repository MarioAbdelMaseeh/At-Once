//
//  SupplierAlert.swift
//  AtOnce
//
//  Created by mac on 01/07/2025.
//


enum SupplierAlert: Identifiable, Equatable {
    case message(String)
    
    var id: String {
        switch self {
        case .message(let msg): return msg
        }
    }
}