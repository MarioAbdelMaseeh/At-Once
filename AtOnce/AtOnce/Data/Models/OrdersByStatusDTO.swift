//
//  OrdersByStatusDTO.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 28/06/2025.
//

struct OrderByStatusResponseDTO: Decodable {
    let message: String?
    let result: OrdersListDTO?
}

struct OrdersListDTO: Decodable {
    let items: [OrderDTO]
}

struct OrderDTO: Decodable {
    let orderId: Int
    let quantity: Int
    let totalPrice: Double
    let wareHouseName: String
    let status: String
    let createdAt: String
    let wareHouseImage: String
    let details: [OrderDetailsDTO]
}

struct OrderDetailsDTO: Decodable {
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
