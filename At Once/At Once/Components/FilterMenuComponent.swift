//
//  FilterMenuComponent.swift
//  At Once
//
//  Created by Iman Mahmoud on 18/06/2025.
//

import SwiftUI

struct FilterMenuComponent: View {
    let options: [String]
    @Binding var selectedOption: String

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(option) {
                    selectedOption = option
                }
            }
        } label: {
            Image(systemName: "line.horizontal.3.decrease")
                .font(.title)
                .foregroundColor(.primaryTeal)
        }
    }
}

//#Preview {
//    FilterMenuComponent()
//}

