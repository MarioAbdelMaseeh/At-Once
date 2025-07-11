//
//  StoreTabView.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//


import SwiftUI

struct StoreTabView: View {
    let stores: [CartWarehouse]
    @Binding var selectedIndex: Int

    var body: some View {
        let maxVisibleTabs = 3
        let tabWidth = UIScreen.main.bounds.width / CGFloat(maxVisibleTabs)

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(stores.indices, id: \.self) { index in
                    let isSelected = selectedIndex == index
                    let storeName = stores[index].warehouseName ?? "Store"

                    Button(action: {
                        withAnimation {
                            selectedIndex = index
                        }
                    }) {
                        VStack(spacing: 6) {
                            Text(storeName)
                                .foregroundColor(isSelected ? .primary : Color(.systemGray))
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                                .lineLimit(1)
                                .truncationMode(.tail)

                            Capsule()
                                .fill(isSelected ? Color.teal : Color.clear)
                                .frame(height: 3)
                        }
                        .frame(width: tabWidth)
                    }
                }
            }
            .padding(.top)
        }
    }
}

