//
//  StoreOrder.swift
//  At Once
//
//  Created by mac on 19/06/2025.
//

import Foundation


struct StoreOrder: Identifiable {
    var id = UUID()
    var name: String
    var orders: [ProductOrder]
}
struct ProductOrder: Identifiable {
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
