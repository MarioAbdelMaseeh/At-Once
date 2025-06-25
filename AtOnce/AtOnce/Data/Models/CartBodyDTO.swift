//
//  CartBody.swift
//  AtOnce
//
//  Created by mac on 25/06/2025.
//

struct CartBodyDTO: Codable {
    let warehouseId: Int
    let pharmacyId: Int
    let medicineId: Int
    let englishMedicineName: String
    let arabicMedicineName: String
    let medicineUrl: String
    let warehouseUrl: String
    let price: Double
    let quantity: Int
    let discount: Double
}
