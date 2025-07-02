//
//  ShimmerOrderCard.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 02/07/2025.
//

import SwiftUI
import Shimmer

struct ShimmerOrderCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 24, height: 24)
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 100, height: 16)
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 60, height: 16)
                
                Spacer()
                
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 24, height: 24)
            }

            HStack {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 24, height: 24)

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 150, height: 16)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.customBackground))
        .cornerRadius(12)
        .shimmering()
    }
}
