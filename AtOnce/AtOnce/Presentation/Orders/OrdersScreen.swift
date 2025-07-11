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
                    if viewModel.isLoading {
                        ForEach(0..<5, id: \.self) { _ in
                            ShimmerOrderCard()
                        }
                    }else if viewModel.orders.isEmpty {
                        Spacer().frame(height: 64)
                        Lottie(animationName: "Empty-Orders")
                            .frame(width: 250, height: 250)
                        Spacer()
                    }else if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .padding()
                    }
                    else {
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
