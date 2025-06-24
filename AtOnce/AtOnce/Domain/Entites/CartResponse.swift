//
//  CartResponse.swift
//  AtOnce
//
//  Created by Adham Mohamed on 24/06/2025.
//

import Foundation

struct CartResponse: Identifiable {
    let id = UUID()
    let success: Bool
    let message: String
    let data: CartData?
}

struct CartData: Identifiable {
    let id = UUID()
    let totalQuantity: Int
    let totalPriceBeforeDisscount: Double
    let totalPriceAfterDisscount: Double
    let warehouses: [CartWarehouse]
}

struct CartWarehouse: Identifiable {
    let id = UUID()
    let warehouseId: Int
    let warehouseUrl: String?
    let warehouseName: String?
    let minimumPrice: Double?
    let totalQuantity: Int?
    let totalPriceBeforeDiscount: Double?
    let totalPriceAfterDiscount: Double?
    let items: [CartItem]
}

struct CartItem: Identifiable {
    let id = UUID()
    let medicineId: Int
    let arabicMedicineName: String
    let englishMedicineName: String
    let medicineUrl: String
    let quantity: Int
    let priceAfterDiscount: Double
    let priceBeforeDiscount: Double
    let discount: Double
}
