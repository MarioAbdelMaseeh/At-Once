//
//  CartScreen.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//

import SwiftUI

struct CartScreen: View {
    @State private var selectedIndex = 0
    
    @State private var stores: [Store] = [
        Store(name: "Store 1", orders: ["Order 1", "Order 2"]),
        Store(name: "Store 2", orders: ["Order A", "Order B", "Order C","Order d", "Order f", "Order g"]),
        Store(name: "Store 3", orders: ["Order X"]),
        Store(name: "Pharama", orders: ["Order 1", "Order 2"])
    ]
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Spacer()
                    Text("Cart").font(.largeTitle)
                    Spacer()
                }.padding()
                StoreTabView(stores: stores, selectedIndex: $selectedIndex).padding()
                Spacer().frame(height: 16)
                ScrollView{
                    LazyVStack(spacing: 12) {
                        ForEach(Array(stores[selectedIndex].orders.enumerated()), id: \.element) { index, order in
                            CartCell(medecinName: order) {
                                stores[selectedIndex].orders.remove(at: index)
                                if(stores[selectedIndex].orders.isEmpty){
                                    stores.remove(at: selectedIndex)
                                    if selectedIndex >= stores.count {
                                        selectedIndex = max(0, stores.count - 1)
                                    }
                                }
                            }
                        }
                    }.padding()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    CartScreen()
}
