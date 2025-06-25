//
//  CartScreen.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//

import SwiftUI

struct CartScreen: View {
    
    @State private var selectedIndex = 0
    
//    private var subTotal: Double = 1000.00
//    private var discount: Double {
//        0.0
//    }
//    private var total: Double {
//        subTotal - discount
//    }
    
   
    
    
    @ObservedObject var viewModel: CartViewModel
    
    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
            if viewModel.cartWarehousesList.indices.contains(selectedIndex) {
                let subTotal = viewModel.cartWarehousesList[selectedIndex].totalPriceBeforeDiscount ?? 0
                let total = viewModel.cartWarehousesList[selectedIndex].totalPriceAfterDiscount ?? 0
                let discount = subTotal - total

                VStack {
                    StoreTabView(stores: viewModel.cartWarehousesList, selectedIndex: $selectedIndex)
                        .padding(.horizontal)

                    Spacer().frame(height: 16)

                    ScrollView {
                        LazyVStack(spacing: 12) {
                            if viewModel.isLoading {
                                ForEach(0..<5, id: \.self) { _ in
                                    CartCellShimmer()
                                }
                            } else {
                                CartItemListView(
                                    warehouse: $viewModel.cartWarehousesList[selectedIndex],
                                    viewModel: viewModel, onUpdate: { warehouseId, medicineId, quantity in
                                        viewModel.updateItem(warehouseId: warehouseId, medicineId: medicineId, quantity: quantity)
                                    }
                                )
                            }
                        }
                    }.padding()
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
                    }
                    
                    LargeButtonComponent(
                        label: String(
                            format: NSLocalizedString("checkout_with_total", comment: ""),
                            "\(total.localizedDigits) \(NSLocalizedString("egp_currency", comment: ""))"
                        )
                    ) {
                        // checkout action
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
}

//#Preview {
//    CartScreen()
//}
