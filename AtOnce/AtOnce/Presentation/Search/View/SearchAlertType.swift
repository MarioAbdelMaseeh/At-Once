//
//  SearchAlertType.swift
//  AtOnce
//
//  Created by mac on 01/07/2025.
//


enum SearchAlertType: Identifiable, Equatable {
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
        case .success: return "Success"
        case .error: return "Error"
        }
    }

    var message: String {
        switch self {
        case .success(let msg), .error(let msg): return msg
        }
    }

    var isError: Bool {
        if case .error = self { return true }
        return false
    }
}
