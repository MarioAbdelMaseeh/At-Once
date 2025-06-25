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
    
    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    if viewModel.isLoading{
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
                            }
                        )
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
                            Text("\(NSLocalizedString("min_order_limit", comment: "")) \(minimum.localizedDigits) \(NSLocalizedString("egp_currency", comment: ""))").font(.caption).foregroundStyle(Color.red)
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
    }
}
