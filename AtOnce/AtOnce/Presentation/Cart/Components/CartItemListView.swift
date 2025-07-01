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
    
    @State private var selectedItem: SelectedCartItem?
    var onUpdate: (_ warehouseId: Int, _ medicineId: Int, _ quantity: Int ) -> Void
    var onDeleteRequest: (_ warehouseId: Int, _ itemId: Int, _ itemName: String) -> Void
    
    var body: some View {
            VStack {
                ForEach(warehouse.items.indices, id: \.self) { index in
                    CartCell(order: warehouse.items[index]) {
                        onDeleteRequest(warehouse.warehouseId, warehouse.items[index].medicineId,  warehouse.items[index].englishMedicineName)
                    } onUpdate: { medicineId, quantity in
                        onUpdate(warehouse.warehouseId, medicineId, quantity)
                    }
                }
            }
            .alert(item: $selectedItem) { item in
                let cartItem = warehouse.items[item.index]
                return Alert(
                    title: Text("Confirm Deletion"),
                    message: Text("Are you sure you want to delete this item?"),
                    primaryButton: .destructive(Text("Delete")) {
                        viewModel.deleteItem(
                            warehouseId: warehouse.warehouseId,
                            itemId: cartItem.medicineId
                        )
                        warehouse.items.remove(at: item.index)
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
struct SelectedCartItem: Identifiable {
    let id = UUID()
    let index: Int
}
