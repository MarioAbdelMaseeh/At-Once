//
//  ProductCard.swift
//  At Once
//
//  Created by Iman Mahmoud on 17/06/2025.
//

import SwiftUI

struct StoreCard: View {
    let discount : Int = 26
    let price : Double = 21
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Image(.icon)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipped()
                .cornerRadius(8)

            
            Text("Product Name name")
                .font(.headline)
               // .fontWeight(.semibold)
//                .font(.title2)
//                .fontWeight(.bold)
               // .padding(.top,8)
            
          //  Text("Discount:\(discount) %")
           // Text("discount_label \(discount)")
            Text(String(format: NSLocalizedString("discount_format", comment: ""), discount.localizedDigits))
                .font(.subheadline)
               // .font(.title3)
             //   .fontWeight(.bold)
                .foregroundColor(Color.primaryTeal)
               // .padding(.vertical,2)
            
            
         //  Text("Price : \(price) EGP")
            Text(String(format: NSLocalizedString("price_format", comment: ""), price.localizedDigits))
           
                .font(.subheadline)
              //  .font(.title3)
               // .fontWeight(.semibold)

               // .padding(.vertical,4)
               // .padding(.bottom,8)
            
            MediumButton(buttonLabel: NSLocalizedString("add_to_cart", comment: ""),
                         buttonIcon: "cart", color: Color.primaryTeal,action: {
                
            })//.padding(.top,8)
            
            
            
            
        }
        .padding()
        .background(Color(.customBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                
    }
}

#Preview {
    StoreCard()
}
