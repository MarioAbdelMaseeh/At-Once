//
//  Warehouse.swift
//  At Once
//
//  Created by mac on 21/06/2025.
//
struct APIResponse<T: Decodable>: Decodable {
    let items: T
//    let status: Int?
//    let message: String?
}

struct WarehouseDTO: Decodable {
    let id: Int?
    let name: String?
    let address: String?
    let imageUrl: String?
    let minmumPrice: Int?
    let delivaryRate: String?
    let governate: String?
    
}
