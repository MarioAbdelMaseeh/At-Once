//
//  StoreTabView.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//


import SwiftUI

struct Store: Identifiable {
    let id = UUID()
    let name: String
    let orders: [String] // Or your own Order model
}

struct StoreTabView: View {
    let stores: [Store]
    @Binding var selectedIndex: Int

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
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

                            Capsule()
                                .fill(selectedIndex == index ? Color.teal : Color.clear)
                                .frame(height: 3)
                                .frame(maxWidth: .infinity)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.top)
        }
    }
}
