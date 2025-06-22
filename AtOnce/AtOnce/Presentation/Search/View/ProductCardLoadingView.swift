//
//  ProductCardLoadingView.swift
//  AtOnce
//
//  Created by mac on 23/06/2025.
//


import SwiftUI

struct ProductCardLoadingView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top) {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 80, height: 80)
                    .padding(.trailing, 8)

                VStack(alignment: .leading, spacing: 8) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 16)
                        .frame(maxWidth: .infinity)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 12)
                        .frame(maxWidth: 120)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 12)
                        .frame(maxWidth: 80)
                }
            }

            HStack(spacing: 8) {
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 36)
                    .frame(maxWidth: .infinity)

                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 36)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .background(Color(.customBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .redacted(reason: .placeholder)
        .shimmering()
    }
}
