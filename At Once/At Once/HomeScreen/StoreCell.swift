//
//  StoreCell.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//
import SwiftUI

struct StoreCell: View {
    var storeName: String = "My Store"
    var storeAddress: String = "Store Address"
    var mini: Int = 700

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(.icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.trailing, 12)

                VStack(alignment: .leading, spacing: 4) {
                    Text(storeName)
                        .font(.headline)
                        .fontWeight(.bold)

                    Text(storeAddress)
                        .font(.caption)
                        .foregroundColor(.gray)

                    Text("Minimum: \(mini) EGP")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Text("Delivery Daily")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                Spacer()
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
        )
        .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 2)
    }
}

#Preview {
    StoreCell()
        .padding()
        .background(Color(.systemGray6))
}
