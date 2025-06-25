//
//  CartItemListView.swift
//  AtOnce
//
//  Created by Adham Mohamed on 25/06/2025.
//

import SwiftUI


struct CartItemListView: View {
    
    
    @Binding var warehouse: CartWarehouse
    
    var viewModel: CartViewModel
    
    @State private var showAlert = false
    @State private var selectedItemIndex: Int?
    var onUpdate: (_ warehouseId: Int, _ medicineId: Int, _ quantity: Int ) -> Void
    //  var onDelete: (Int) -> Void
    
    var body: some View {
        ForEach(warehouse.items.indices, id: \.self) { index in
            CartCell(order: warehouse.items[index] ) {
                selectedItemIndex = index
                showAlert = true
            } onUpdate:{ medicineId, quantity in
                onUpdate(warehouse.warehouseId, medicineId, quantity)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Confirm Deletion"),
                    message: Text("Are you sure you want to delete this item?"),
                    primaryButton: .destructive(Text("Delete")) {
                        if let index = selectedItemIndex {
                            let item = warehouse.items[index]
                            viewModel.deleteItem(warehouseId: warehouse.warehouseId, itemId: item.medicineId)
                            warehouse.items.remove(at: index)
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
}
