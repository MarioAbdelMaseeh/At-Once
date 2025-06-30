//
//  OrdersScreen.swift
//  At Once
//
//  Created by Iman Mahmoud on 17/06/2025.
//

import SwiftUI

struct OrdersScreen: View {
    @State private var selectedStatus: OrderStatus = .ordered
    @State private var expandedOrderId: UUID?
    
    @State private var isExpanded: Bool = false
    
//    var filteredOrders :[Order] {
//        orders.filter { $0.status == selectedStatus }
//    }
    
    @ObservedObject var viewModel: OrdersViewModel
    
    init(viewModel: OrdersViewModel){
        self.viewModel = viewModel
    }

    var body: some View {
        
            VStack(spacing: 16) {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(OrderStatus.allCases, id: \.self) { status in
                            
                            OrdersChip(title: status.localizedValue, isSelected: selectedStatus == status)
                                .onTapGesture {
                                    withAnimation {
                                        selectedStatus = status
                                        viewModel.fetchOrders(status: status, pharmacyId: viewModel.cachedPharmacy?.id ?? 2)
                                    }
                                   
                                }
                            
                        }
                    }
                    .padding()
                }
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(viewModel.orders) { order in
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
        }.padding(.top)
    }
}
