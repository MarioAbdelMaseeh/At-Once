//
//  Untitled.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 22/06/2025.
//

import Foundation

struct SuppliersProduct: Identifiable {
    let id = UUID()
    let warehouseId: Int
    let warehHouseName: String
    let medicineId: Int
    let medicineName: String
    let medicinePrice: Double
    let warehouseImageUrl: String
    let discount: Double
    let finalPrice: Double
    let wareHouseAreaName: String
    let quantity: Int
}
