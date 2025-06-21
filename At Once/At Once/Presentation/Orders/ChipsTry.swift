//
//  ChipsTry.swift
//  At Once
//
//  Created by Iman Mahmoud on 19/06/2025.
//

import SwiftUI

struct ChipsTry: View {
    @State private var selectedStatus: OrderStatus = .ordered
    var body: some View {
        Picker("Status", selection: $selectedStatus) {
                        ForEach(OrderStatus.allCases, id: \.self) {
                            Text($0.rawValue.capitalized)
                        }
                    }
        .pickerStyle(.wheel)
                    .padding()
    }
}

#Preview {
    ChipsTry()
}
