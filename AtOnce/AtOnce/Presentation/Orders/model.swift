//
//  model.swift
//  At Once
//
//  Created by Iman Mahmoud on 17/06/2025.
//

import Foundation

enum OrderStatus: String, CaseIterable {
    case ordered = "Ordered"
    case preparing = "Preparing"
    case delivering = "Delivering"
    case delivered = "Delivered"
    case canceled = "Canceled"
    case returned = "Returned"
    
    var localizedValue: String {
        switch self {
        case .ordered:
            return NSLocalizedString("order_status_ordered", comment: "")
        case .preparing:
            return NSLocalizedString("order_status_preparing", comment: "")
        case .delivering:
            return NSLocalizedString("order_status_delivering", comment: "")
        case .delivered:
            return NSLocalizedString("order_status_delivered", comment: "")
        case .canceled:
            return NSLocalizedString("order_status_canceled", comment: "")
        case .returned:
            return NSLocalizedString("order_status_returned", comment: "")
        }
    }
}

extension OrderStatus {
    var toInt: Int {
        switch self {
        case .ordered: return 0
        case .preparing: return 1
        case .delivering: return 2
        case .delivered: return 3
        case .canceled: return 4
        case .returned: return 5
        }
    }
}
