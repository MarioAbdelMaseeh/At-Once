//
//  CartScreen.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//

import SwiftUI

struct CartScreen: View {
    
    @State private var selectedIndex = 0
    
    var subTotal: Double {
        guard viewModel.cartWarehousesList.indices.contains(selectedIndex) else { return 0 }
        return viewModel.cartWarehousesList[selectedIndex].totalPriceBeforeDiscount ?? 0
    }
    
    var total: Double {
        guard viewModel.cartWarehousesList.indices.contains(selectedIndex) else { return 0 }
        return viewModel.cartWarehousesList[selectedIndex].totalPriceAfterDiscount ?? 0
    }
    
    var discount: Double {
        subTotal - total
    }
    var minimum: Double{
        guard viewModel.cartWarehousesList.indices.contains(selectedIndex) else { return 0 }
        return viewModel.cartWarehousesList[selectedIndex].minimumPrice ?? 0
    }
    
    @ObservedObject var viewModel: CartViewModel
    @State private var activeAlert: CartAlert?
    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    if viewModel.isLoading{
                        Spacer().frame(height: 48)
                        ForEach(0..<3, id: \.self) { _ in
                            CartCellShimmer()
                        }
                    }
                    else if viewModel.cartWarehousesList.indices.contains(selectedIndex) {
                        StoreTabView(stores: viewModel.cartWarehousesList, selectedIndex: $selectedIndex)
                        Spacer().frame(height: 16)
                        CartItemListView(
                            warehouse: $viewModel.cartWarehousesList[selectedIndex],
                            viewModel: viewModel, onUpdate: { warehouseId, medicineId, quantity in
                                viewModel.updateItem(warehouseId: warehouseId, medicineId: medicineId, quantity: quantity)
                            }, onDeleteRequest: { warehouseId, itemId, itemName in
                                activeAlert = .deleteConfirm(warehouseId: warehouseId, itemId: itemId, itemName: itemName)
                            }
                        )
                    }else if (viewModel.cartWarehousesList.isEmpty){
                        Spacer().frame(height: 64)
                        Lottie(animationName: "Empty-Cart")
                            .frame(width: 250, height: 250)
                        Spacer()
                    }
                }
            }
            Spacer()
            VStack(alignment: .leading) {
                Group {
                    HStack {
                        Text(NSLocalizedString("subtotal", comment: ""))
                            .font(.subheadline)
                        Spacer()
                        Text("\(NSLocalizedString("egp_currency", comment: "")) \(subTotal.localizedDigits)")
                            .font(.subheadline)
                    }
                    HStack {
                        Text(NSLocalizedString("discount", comment: ""))
                            .font(.footnote)
                        Spacer()
                        Text("\(NSLocalizedString("egp_currency", comment: "")) \(discount.localizedDigits)")
                            .font(.footnote)
                    }
                    
                    HStack {
                        Text(NSLocalizedString("total", comment: ""))
                            .font(.title3)
                        Spacer()
                        Text("\(NSLocalizedString("egp_currency", comment: "")) \(total.localizedDigits)")
                            .font(.title3)
                    }
                    if(total < minimum){
                        HStack{
                            Spacer()
                            Text(String(format: NSLocalizedString("min_order_limit_full", comment: ""), minimum.localizedDigits))
                                .font(.caption)
                                .foregroundStyle(Color.red)
                            Spacer()
                        }
                    }
                }
                
                LargeButtonComponent(
                    label: String(
                        format: NSLocalizedString("checkout_with_total", comment: ""),
                        "\(total.localizedDigits) \(NSLocalizedString("egp_currency", comment: ""))"
                    )
                ) {
                    viewModel.placeOrder(warehouseId: viewModel.cartWarehousesList[selectedIndex].warehouseId)
                }.disabled(total < minimum || total == 0)
                    .opacity((total < minimum || total == 0) ? 0.5 : 1)
            }
        }.padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(NSLocalizedString("cart", comment: ""))
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
            .onReceive(viewModel.$successMessage.compactMap { $0 }) { msg in
                activeAlert = .message(msg)
            }
            .onReceive(viewModel.$errorMessage.compactMap { $0 }) { msg in
                activeAlert = .message(msg)
            }
            .alert(item: $activeAlert) { alert in
                switch alert {
                case .message(let msg):
                    return Alert(title: Text(msg))
                    
                case .deleteConfirm(let warehouseId, let itemId, let itemName):
                    return Alert(
                        title: Text("confirm_deletion_title".localized),
                        message: Text(String(format: NSLocalizedString("confirm_deletion_message", comment: ""), itemName)),
                        primaryButton: .destructive(Text("delete_button".localized)) {
                            if selectedIndex == viewModel.cartWarehousesList.count - 1 {
                                selectedIndex -= 1
                            }
                            viewModel.deleteItem(warehouseId: warehouseId, itemId: itemId)
                            
                        },
                        secondaryButton: .cancel(Text("cancel".localized))
                    )
                }
            }
    }
}
