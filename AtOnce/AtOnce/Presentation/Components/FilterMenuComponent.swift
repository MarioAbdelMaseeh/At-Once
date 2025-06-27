//
//  FilterMenuComponent.swift
//  At Once
//
//  Created by Iman Mahmoud on 18/06/2025.
//

import SwiftUI

struct FilterMenuComponent: View {
    let options: [FilterOption]
    @Binding var selectedOption: FilterOption

    var body: some View {
        Menu {
            ForEach(options) { option in
                Button {
                    selectedOption = option
                } label: {
                    HStack {
                        Text(option.label)
                        if option == selectedOption {
                            Spacer()
                            Image(systemName: "checkmark")
                                .foregroundColor(.primaryTeal)
                        }
                    }
                }
            }
        } label: {
            HStack(spacing: 4) {
                Image(systemName: "line.horizontal.3.decrease")
                    .font(.title3)
                    .foregroundColor(.primaryTeal)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(Color.primaryTeal.opacity(0.1))
            .cornerRadius(8)
        }
    }
}
