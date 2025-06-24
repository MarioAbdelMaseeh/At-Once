//
//  CartItemListView.swift
//  AtOnce
//
//  Created by Adham Mohamed on 25/06/2025.
//

import SwiftUI


struct CartItemListView: View {
    @Binding var warehouse: CartWarehouse
    var onDelete: (Int) -> Void

    var body: some View {
        ForEach(warehouse.items.indices, id: \.self) { index in
            CartCell(order: warehouse.items[index]) {
                onDelete(index)
            }
        }
    }
}
