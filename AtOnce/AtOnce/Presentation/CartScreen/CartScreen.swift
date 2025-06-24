//
//  CartScreen.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//

import SwiftUI

struct CartScreen: View {
    
    @State private var selectedIndex = 0
    private var subTotal: Double = 1000.00
    private var discount: Double {
        0.0 
    }
    private var total: Double {
        subTotal - discount
    }
    
    
    @StateObject var viewModel: CartViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: AppDIContainer.shared.container.resolve(CartViewModelProtocol.self)! as! CartViewModel)
    }
    
    
    @State private var stores: [CartWarehouse] = []

    var body: some View {
        NavigationStack{
            VStack{
                StoreTabView(stores: stores, selectedIndex: $selectedIndex).padding(.horizontal)
                Spacer().frame(height: 16)
                ScrollView{
                    LazyVStack(spacing: 12) {
//                        ForEach(Array(stores[selectedIndex].orders.enumerated()), id: \.element.id) { index, _ in
//                            CartCell(order: $stores[selectedIndex].orders[index]) {
//                                stores[selectedIndex].orders.remove(at: index)
//                                if stores[selectedIndex].orders.isEmpty {
//                                    stores.remove(at: selectedIndex)
//                                    selectedIndex = max(0, stores.count - 1)
//                                }
//                            }
//                        }
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
}

#Preview {
    CartScreen()
}
