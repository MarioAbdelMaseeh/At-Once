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
}

struct OrderItem: Identifiable {
    let id : String
    let name: String
    let quantity: Int
    let price: Double
}

struct Order: Identifiable {
    let id : String
    let pharmacyName: String
    let date: String
    let location: String
    let items: [OrderItem]
    let status: OrderStatus
}
