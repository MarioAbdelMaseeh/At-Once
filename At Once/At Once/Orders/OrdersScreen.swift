//
//  OrdersScreen.swift
//  At Once
//
//  Created by Iman Mahmoud on 17/06/2025.
//

import SwiftUI

struct OrdersScreen: View {
    @State private var selectedStatus: OrderStatus = .ordered
    @State private var expandedOrderId: String?
    
    @State private var isExpanded: Bool = false
    
    

  
    let orders: [Order] = [
        Order(id: "12345", pharmacyName: "UM Pharma", date: "25/05/2024 - 18:00 PM", location: "Zefta, Gharbia", items: Array(repeating: OrderItem(id: "5678",name: "Panadol Extra 600mg", quantity: 3, price: 150), count: 4)),
        Order(id: "12346", pharmacyName: "UM Pharma", date: "25/05/2024 - 18:00 PM", location: "Zefta, Gharbia", items: Array(repeating: OrderItem(id: "5678",name: "Panadol Extra 600mg", quantity: 3, price: 150), count: 4)),
        
        Order(id: "12347", pharmacyName: "UM Pharma", date: "25/05/2024 - 18:00 PM", location: "Zefta, Gharbia", items: Array(repeating: OrderItem(id: "5678",name: "Panadol Extra 600mg", quantity: 3, price: 150), count: 4)),
    ]

    var body: some View {
    
        NavigationStack {
            
            
            VStack(spacing: 16) {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(OrderStatus.allCases, id: \.self) { status in
                            
                            OrdersChip(title: status.rawValue, isSelected: selectedStatus == status)
                                .onTapGesture {
                                    withAnimation {
                                        selectedStatus = status
                                    }
                                   
                                }
                            
                        }
                    }
                    .padding()
                }
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(orders) { order in
                            OrderCard(
                                order: order,
                                isExpanded: expandedOrderId == order.id
                                , toggleExpand: {
                                    withAnimation {
                                        
                                        if expandedOrderId == order.id {
                                            expandedOrderId = nil
                                            
                                        } else {
                                            expandedOrderId = order.id
                                            
                                        }
                                    }
                                }
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Orders")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
            }
        }
            
            
    }
}


#Preview {
    OrdersScreen()
}
