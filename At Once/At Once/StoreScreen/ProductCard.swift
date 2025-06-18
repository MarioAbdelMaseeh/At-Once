//
//  ProductCard.swift
//  At Once
//
//  Created by Iman Mahmoud on 17/06/2025.
//

import SwiftUI

struct ProductCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Image(.icon)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipped()
                .cornerRadius(8)

            
            Text("Product Name name")
                .font(.subheadline)
                .fontWeight(.semibold)
//                .font(.title2)
//                .fontWeight(.bold)
                .padding(.top)
            
            Text("Discount: 26%")
                .font(.caption)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.primaryTeal)
                .padding(.vertical,2)
            
            
            Text("Price : 21.76 EGP")
                .font(.caption)
              //  .font(.title3)
                .fontWeight(.semibold)

                .padding(.top,4)
            
            MediumButton(buttonLabel: "Add to Cart", buttonIcon: "cart",action: {
                
            }).padding(.top)
            
            
            
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                
    }
}

#Preview {
    ProductCard()
}
