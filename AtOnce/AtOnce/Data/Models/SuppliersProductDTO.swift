//
//  SuppliersProduct.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 22/06/2025.
//

struct SuppliersProductDTO: Decodable {
    let warehouseId: Int?
    let warehHouseName: String?
    let medicineId: Int?
    let drug: Int?
    let warehouseImageUrl: String?
    let medicineName: String?
    let medicinePrice: Double?
    let discount: Double?
    let finalPrice: Double?
    let wareHouseAreaName: String?
    let quantity: Int?
}

