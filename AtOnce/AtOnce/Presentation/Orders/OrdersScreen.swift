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
    
    var filteredOrders :[Order] {
        orders.filter { $0.status == selectedStatus }
    }
    

    
    let orders: [Order] = [
        Order(id: "12345", pharmacyName: "UM Pharma", date: "25/05/2024 - 18:00 PM", location: "Zefta, Gharbia", items: Array(repeating: OrderItem(id: "5678",name: "Panadol Extra 600mg", quantity: 3, price: 150), count: 4),status: .canceled),
    
        Order(id: "12346", pharmacyName: "UM Pharma", date: "25/05/2024 - 18:00 PM", location: "Zefta, Gharbia", items: Array(repeating: OrderItem(id: "5678",name: "Panadol Extra 600mg", quantity: 3, price: 120), count: 4),status: .delivered),
        
        Order(id: "12347", pharmacyName: "UM Pharma", date: "25/05/2024 - 18:00 PM", location: "Zefta, Gharbia", items: Array(repeating: OrderItem(id: "5678",name: "Panadol Extra 600mg", quantity: 3, price: 250), count: 4),status: .ordered),
        
        Order(id: "12348", pharmacyName: "UM Pharma", date: "25/05/2024 - 18:00 PM", location: "Zefta, Gharbia", items: Array(repeating: OrderItem(id: "5678",name: "Panadol Extra 600mg", quantity: 3, price: 50), count: 4),status: .ordered),
        
        Order(id: "12349", pharmacyName: "UM Pharma", date: "25/05/2024 - 18:00 PM", location: "Zefta, Gharbia", items: Array(repeating: OrderItem(id: "5678",name: "Panadol Extra 600mg", quantity: 3, price: 100), count: 4),status: .delivering),
        
        Order(id: "12440", pharmacyName: "UM Pharma", date: "25/05/2024 - 18:00 PM", location: "Zefta, Gharbia", items: Array(repeating: OrderItem(id: "5678",name: "Panadol Extra 600mg", quantity: 3, price: 110), count: 4),status: .ordered),
        
        Order(id: "12449", pharmacyName: "UM Pharma", date: "25/05/2024 - 18:00 PM", location: "Zefta, Gharbia", items: Array(repeating: OrderItem(id: "5678",name: "Panadol Extra 600mg", quantity: 3, price: 88), count: 4),status: .delivering),
        
        Order(id: "12440", pharmacyName: "UM Pharma", date: "25/05/2024 - 18:00 PM", location: "Zefta, Gharbia", items: Array(repeating: OrderItem(id: "5678",name: "Panadol Extra 600mg", quantity: 3, price: 186), count: 4),status: .preparing),
    ]
    
  

    var body: some View {
        
//        let filterOrders  = orders.filter { $0.status == selectedStatus }
    
        NavigationStack {
            
            
            VStack(spacing: 16) {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(OrderStatus.allCases, id: \.self) { status in
                            
                            OrdersChip(title: status.localizedValue, isSelected: selectedStatus == status)
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
                        ForEach(filteredOrders) { order in
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
                    Text("orders".localized)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
            }
        }.padding(.top)
            
            
    }
}


#Preview {
    OrdersScreen()
}
