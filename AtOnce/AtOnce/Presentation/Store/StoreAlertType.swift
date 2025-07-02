//
//  StoreAlertType.swift
//  AtOnce
//
//  Created by mac on 01/07/2025.
//


enum StoreAlertType: Identifiable, Equatable {
    case success(message: String)
    case error(message: String)
    
    var id: String {
        switch self {
        case .success(let msg): return "success-\(msg)"
        case .error(let msg): return "error-\(msg)"
        }
    }
    
    var title: String {
        switch self {
        case .success: return "success_title".localized
        case .error: return "error_title".localized
        }
    }
    
    var message: String {
        switch self {
        case .success(let msg), .error(let msg): return msg
        }
    }
}
