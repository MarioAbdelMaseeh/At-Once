//
//  CartScreen.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//

import SwiftUI

struct CartScreen: View {
    @State private var selectedIndex = 0
    private var subTotal: Double {
        stores[selectedIndex].orders.reduce(0) { $0 + $1.total }
    }
    private var discount: Double {
        0.0 
    }
    private var total: Double {
        subTotal - discount
    }
    @State private var stores: [StoreOrder] = [
        StoreOrder(name: "Grocery Store", orders: [
            CartOrder(name: "Apples", quantity: 3, pricePerItem: 5.0, discount: 10),
            CartOrder(name: "Bananas", quantity: 2, pricePerItem: 4.5, discount: 20),
            CartOrder(name: "Milk", quantity: 1, pricePerItem: 15.0, discount: 15),
            CartOrder(name: "Bread", quantity: 2, pricePerItem: 10.0, discount: 8)
        ]),
        StoreOrder(name: "Electronics Hub", orders: [
            CartOrder(name: "USB Cable", quantity: 1, pricePerItem: 25.0, discount: 3),
            CartOrder(name: "Bluetooth Speaker", quantity: 1, pricePerItem: 150.0, discount: 5),
            CartOrder(name: "Phone Case", quantity: 2, pricePerItem: 30.0, discount: 10)
        ]),
        StoreOrder(name: "Pharmacy", orders: [
            CartOrder(name: "Vitamin C", quantity: 1, pricePerItem: 50.0, discount: 40),
            CartOrder(name: "Painkiller", quantity: 3, pricePerItem: 12.0, discount: 2),
            CartOrder(name: "Bandages", quantity: 5, pricePerItem: 2.0, discount: 24),
            CartOrder(name: "Thermometer", quantity: 1, pricePerItem: 85.0, discount: 16)
        ]),
        StoreOrder(name: "Book Store", orders: [
            CartOrder(name: "Notebook", quantity: 4, pricePerItem: 10.0, discount: 18),
            CartOrder(name: "Novel", quantity: 2, pricePerItem: 45.0, discount: 12),
            CartOrder(name: "Pen Set", quantity: 1, pricePerItem: 20.0, discount: 13),
            CartOrder(name: "Planner", quantity: 1, pricePerItem: 30.0, discount: 17),
            CartOrder(name: "Bookmark", quantity: 3, pricePerItem: 3.0, discount: 7)
        ]),
        StoreOrder(name: "Pet Supplies", orders: [
            CartOrder(name: "Dog Food", quantity: 2, pricePerItem: 60.0, discount: 23),
            CartOrder(name: "Cat Toy", quantity: 3, pricePerItem: 15.0, discount: 25),
            CartOrder(name: "Leash", quantity: 1, pricePerItem: 40.0, discount: 18)
        ])
    ]
    var body: some View {
        NavigationStack{
            VStack{
                StoreTabView(stores: stores, selectedIndex: $selectedIndex).padding(.horizontal)
                Spacer().frame(height: 16)
                ScrollView{
                    LazyVStack(spacing: 12) {
                        ForEach(Array(stores[selectedIndex].orders.enumerated()), id: \.element.id) { index, _ in
                            CartCell(order: $stores[selectedIndex].orders[index]) {
                                stores[selectedIndex].orders.remove(at: index)
                                if stores[selectedIndex].orders.isEmpty {
                                    stores.remove(at: selectedIndex)
                                    selectedIndex = max(0, stores.count - 1)
                                }
                            }
                        }
                    }.padding()
                }
                Spacer()
                VStack(alignment: .leading){
                    Group {
                        HStack {
                            Text("SubTotal").font(.subheadline)
                            Spacer()
                            Text("\(String(format: "%.2f", subTotal)) EGP").font(.subheadline)
                        }
                        HStack {
                            Text("Discount").font(.footnote)
                            Spacer()
                            Text("\(String(format: "%.2f", discount)) EGP").font(.footnote)
                        }
                        HStack {
                            Text("Total").font(.title3)
                            Spacer()
                            Text("\(String(format: "%.2f", total)) EGP").font(.title3)
                        }
                    }
                    LargeButtonComponent(label: "Checkout \(String(format: "%.2f", total)) EGP") {
                        
                    }
                    
                }.padding(.horizontal)
            }.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal){
                    Text("Cart").font(.title).fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    CartScreen()
}
