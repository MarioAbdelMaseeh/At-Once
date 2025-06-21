//
//  Warehouse.swift
//  At Once
//
//  Created by mac on 21/06/2025.
//


struct WarehouseDTO: Decodable {
    let id: Int
    let name: String
    let address: String
    let imageUrl: String?
    let minimumPrice: Int
    let delivaryRate: String?
    let governate: String
}
