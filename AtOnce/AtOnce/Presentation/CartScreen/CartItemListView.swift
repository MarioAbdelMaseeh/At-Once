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

      
    
    
  //  var onDelete: (Int) -> Void

    var body: some View {
        ForEach(warehouse.items.indices, id: \.self) { index in
            CartCell(order: warehouse.items[index]) {
                           selectedItemIndex = index
                           showAlert = true
                       }
                       .alert(isPresented: $showAlert) {
                           Alert(
                               title: Text("Confirm Deletion"),
                               message: Text("Are you sure you want to delete this item?"),
                               primaryButton: .destructive(Text("Delete")) {
                                   if let index = selectedItemIndex {
                                       let item = warehouse.items[index]
                                       if let pharmacyId = viewModel.userDefaultUseCase.getCachedUser()?.id {
                                           viewModel.deleteItem(pharmacyId: pharmacyId, warehouseId: warehouse.warehouseId, itemId: item.medicineId)
                                
                                         //  viewModel.fetchCartByPharmacyId(pharmacyId: pharmacyId)
                                        
                                           warehouse.items.remove(at: index)
                                       }
                                   }
                               },
                               secondaryButton: .cancel()
                           )
                       }
        }
    }
}
