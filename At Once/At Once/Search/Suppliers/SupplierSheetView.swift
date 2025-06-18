//
//  SupplierSheetView.swift
//  At Once
//
//  Created by Iman Mahmoud on 18/06/2025.
//

import SwiftUI

struct SupplierSheetView: View {
    var body: some View {
        VStack/*(spacing: 10)*/ {

            HStack {
                Image(.icon)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(8)

                Text("Panadol Extra 600mg")
                    .font(.title2.bold())
                Spacer()
            }
            .padding(.horizontal)

            Divider()

            ScrollView {
                VStack(spacing: 16) {
                    ForEach(0..<10) { _ in
                        ProductCardView(isSuppliers: true) 
                    }
                }
                .padding()
            }
        }
        .background(Color(.systemBackground))
        .cornerRadius(20)
    }
}


#Preview {
    SupplierSheetView()
}
