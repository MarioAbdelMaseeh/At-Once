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

struct OrderItem: Identifiable {
    let id : String
    let name: String
    let quantity: Int
    let price: Double
    
    var totalPrice: Double {
        Double(quantity) * price
    }
}

struct Order: Identifiable {
    let id : String
    let pharmacyName: String
    let date: String
    let location: String
    let items: [OrderItem]
    let status: OrderStatus
    
    var total: Double {
        items.reduce(0) { $0 + $1.totalPrice }
    }
}
