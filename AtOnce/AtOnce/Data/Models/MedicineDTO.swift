//
//  Medicine.swift
//  AtOnce
//
//  Created by mac on 22/06/2025.
//


struct Medicine: Codable {
    let medicineId: Int
    let medicineName: String
    let drug: Int
    let price: Double
    let maximumwareHouseAreaName: String
    let imageUrl: String
    let finalPrice: Double
    let totalQuantity: Int
    let distributorsCount: Int
    let warehouseIdOfMaxDiscount: Int
    let warehouseNameOfMaxDiscount: String
    let quantityInWarehouseWithMaxDiscount: Int
    let maximumDiscount: Double
    let minmumPrice: Double
}