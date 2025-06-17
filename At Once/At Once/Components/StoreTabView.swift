//
//  StoreTabView.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//


import SwiftUI

struct Store: Identifiable {
    var id = UUID()
    var name: String
    var orders: [String]
}

struct StoreTabView: View {
    let stores: [Store]
    @Binding var selectedIndex: Int

    var body: some View {
        let maxVisibleTabs = 3
        let tabWidth = (UIScreen.main.bounds.width  - 32) / CGFloat(maxVisibleTabs)

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(stores.indices, id: \.self) { index in
                    Button(action: {
                        withAnimation {
                            selectedIndex = index
                        }
                    }) {
                        VStack(spacing: 6) {
                            Text(stores[index].name)
                                .foregroundColor(selectedIndex == index ? .black : .gray)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity)

                            Capsule()
                                .fill(selectedIndex == index ? Color.teal : Color.clear)
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
