//
//  StoreOrder.swift
//  At Once
//
//  Created by mac on 19/06/2025.
//

import Foundation

//
//struct WarehouseOrder: Identifiable {
//    var id = UUID()
//    var name: String
//    var orders: [WarehouseProduct]
//}
struct WarehouseProduct: Identifiable {
    let id : Int
    let arName: String
    let enName: String
    var quantity: Int
    let prePrice: Double
    let pricePerItem: Double
    let discount: Double
    let imageUrl: String
    var total: Double {
        Double(quantity) * pricePerItem
    }
}
