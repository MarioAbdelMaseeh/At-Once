//
//  CartResponseDTO.swift
//  AtOnce
//
//  Created by Adham Mohamed on 24/06/2025.
//

import Foundation

struct CartResponseDTO: Codable {
    let success: Bool
    let message: String
    let data: CartDataDTO?
}

struct CartDataDTO: Codable {
    let totalQuantity: Int
    let totalPriceBeforeDisscount: Double
    let totalPriceAfterDisscount: Double
    let warehouses: [CartWarehouseDTO]
}

struct CartWarehouseDTO: Codable {
    let warehouseId: Int
    let warehouseUrl: String?
    let items: [CartItemDTO]
}

struct CartItemDTO: Codable {
    let medicineId: Int
    let arabicMedicineName: String
    let englishMedicineName: String
    let medicineUrl: String
    let quantity: Int
    let priceAfterDiscount: Double
    let priceBeforeDiscount: Double
    let discount: Double
}
