//
//  ProductCard.swift
//  At Once
//
//  Created by Iman Mahmoud on 17/06/2025.
//

import SwiftUI

struct StoreCard: View {
    let product : WarehouseProduct
    let addToCart: ()-> Void
    @EnvironmentObject var languageManager: LanguageManager
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8){
            AsyncImage(url: URL(string: product.imageUrl)) { phase in
                           switch phase {
                           case .empty:
                               Rectangle()
                                   .fill(Color.gray.opacity(0.3))
                                   .frame(height: 120)
                                   .cornerRadius(8)
                                   .shimmering()
                           case .success(let image):
                               image
                                   .resizable()
                                   .scaledToFit()
                                   .cornerRadius(8)
                                  // .scaledToFill()
                                   .frame(/*width:180 ,*/height: 120)
                                  // .clipped()
                                   
                           case .failure(_):
                               Image(systemName: "photo")
                                   .resizable()
                                   .scaledToFit()
                                   .frame(height: 120)
                                   .foregroundColor(.gray)
                                   .frame(maxWidth: .infinity)
                                  // .shimmering()
                           @unknown default:
                               EmptyView()
                           }
                       }
            
            Text(languageManager.currentLanguage == .arabic ? product.arName : product.enName)
                .font(.headline)
               // .fontWeight(.semibold)
//                .font(.title2)
//                .fontWeight(.bold)
               // .padding(.top,8)
            
          //  Text("Discount:\(discount) %")
           // Text("discount_label \(discount)")
            Text(String(format: NSLocalizedString("discount_format", comment: ""), product.discount.localizedDigits))
                .font(.subheadline)
               // .font(.title3)
             //   .fontWeight(.bold)
                .foregroundColor(Color.primaryTeal)
               // .padding(.vertical,2)
            
            
         //  Text("Price : \(price) EGP")
//            Text(String(format: NSLocalizedString("price_format", comment: ""), product.pricePerItem.localizedDigits))
//           
//                .font(.subheadline)
            
            HStack{
                Text(String(format: NSLocalizedString("price_format", comment: ""), product.pricePerItem.localizedDigits))
                    .font(.caption)
                Text(String(format: NSLocalizedString("amount_only_format", comment: ""), product.prePrice.localizedDigits))
                    .font(.caption)
                    .foregroundColor(Color(.red))
                            .strikethrough()
                
            }//.padding(.horizontal,4)
            
              //  .font(.title3)
               // .fontWeight(.semibold)

               // .padding(.vertical,4)
               // .padding(.bottom,8)
            
            MediumButton(buttonLabel: NSLocalizedString("add_to_cart", comment: ""),
                         buttonIcon: "cart", color: Color.primaryTeal,action: {
                addToCart()
            })//.padding(.top,8)
            
            
            
            
        }
        .padding(.horizontal,8)
        .padding(.vertical)
        .background(Color(.customBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                
    }
}

#Preview {
    StoreCard(product: WarehouseProduct(id: 1, arName: "ay 7aga", enName: "ay 7aga", quantity: 1, prePrice: 25, pricePerItem: 20, discount: 26.5, imageUrl: "")){
        
    }
}
