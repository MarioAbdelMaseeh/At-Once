//
//  StoreShimmerCard.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 22/06/2025.
//
import SwiftUI
import Shimmer

struct ShimmerCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 120)
                .cornerRadius(8)

            RoundedRectangle(cornerRadius: 4)
                .fill(Color.gray.opacity(0.3))
                .frame(height: 20)

            RoundedRectangle(cornerRadius: 4)
                .fill(Color.gray.opacity(0.3))
                .frame(height: 16)

            RoundedRectangle(cornerRadius: 4)
                .fill(Color.gray.opacity(0.3))
                .frame(height: 16)

            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.3))
                .frame(height: 36)
        }
        .padding()
        .background(Color(.customBackground))
        .cornerRadius(12)
        .redacted(reason: .placeholder)
        .shimmering() 
    }
}
