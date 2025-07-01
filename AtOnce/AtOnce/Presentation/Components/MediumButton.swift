//
//  MediumButton.swift
//  At Once
//
//  Created by Iman Mahmoud on 16/06/2025.
//

import SwiftUI

struct MediumButton: View {
    let buttonLabel: String
    let buttonIcon: String
    let color : Color
    let action: () -> Void
    var isLoading: Bool = false
    var body: some View {
        Button(action: {
            if !isLoading {
                action()
            }
        }) {
            HStack {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .frame(maxWidth: .infinity)
                } else {
                    Text(buttonLabel)
                        .font(.callout)
                        .foregroundColor(.white)
                    Image(systemName: buttonIcon)
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .fontWeight(.semibold)
            .background(color)
            .cornerRadius(10)
        }
        .disabled(isLoading)
    }
}

#Preview {
    MediumButton(buttonLabel: "Add to cart", buttonIcon: "cart",color: Color.primaryTeal, action: { })
}
