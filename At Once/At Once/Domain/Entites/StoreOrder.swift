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
    let id = UUID()
    var name: String
    var quantity: Int
    var pricePerItem: Double
    var discount: Int
    
    var total: Double {
        Double(quantity) * pricePerItem
    }
}
