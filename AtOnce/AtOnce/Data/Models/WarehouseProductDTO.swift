//
//  ProductDTO.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 21/06/2025.
//

struct WarehouseProductDTO: Decodable {
    let medicineId: Int?
    let englishMedicineName: String?
    let arabicMedicineName: String?
    let drug: Int?
    let price: Double?
    let medicineUrl: String?
    let finalprice: Double?
    let quantity: Int?
    let discount: Double?
}

