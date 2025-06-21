//
//  LoadingCell.swift
//  AtOnce
//
//  Created by mac on 21/06/2025.
//

import SwiftUI
import Shimmer

struct LoadingCell: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 80, height: 80)
                        .shimmering()

                    VStack(alignment: .leading, spacing: 8) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 200, height: 20)
                            .shimmering()

                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 150, height: 14)
                            .shimmering()

                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 180, height: 16)
                            .shimmering()

                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 100, height: 16)
                            .shimmering()
                    }

                    Spacer()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemBackground))
                )
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            }
        }

#Preview {
    LoadingCell()
}
