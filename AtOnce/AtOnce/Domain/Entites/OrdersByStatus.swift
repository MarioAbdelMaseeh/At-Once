//
//  OrdersByStatus.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 28/06/2025.
//

import Foundation

struct OrderByStatusResponse {
    let message: String
    let items: [Order]
}

struct Order: Identifiable {
    let id = UUID()
    let orderId: Int
    let quantity: Int
    let totalPrice: Double
    let wareHouseName: String
    let status: String
    let createdAt: String
    let wareHouseImage: String
    let orderDetails: [OrderDetail]
}

struct OrderDetail: Identifiable {
    let id = UUID()
    let arabicMedicineName: String
    let medicineName: String
    let quantity: Int
    let totalPriceAfterDisccount: Double
    let totalPriceBeforeDisccount: Double
    let medicinePrice: Double
    let medicineImage: String
    let discountAmount: Double
    let discountPercentage: Double
}
