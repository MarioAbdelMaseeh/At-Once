//
//  MedicineCardView.swift
//  At Once
//
//  Created by Iman Mahmoud on 18/06/2025.
//

import SwiftUI

struct ProductCardView: View {
    let isSuppliers: Bool
 

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment:.top) {
                Image(.icon)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(.circle)
                    .padding(.trailing, 8)
                
                VStack(alignment:.leading){
                    Text("medicine name name name ")
                        .font(.headline)
                        .lineLimit(2)
                        
                    Text("Discount : 26 %")
                        .foregroundColor(.primaryTeal)
                       // .font(.callout)
                        .padding(.vertical, 4)

                    Text("Price : \(String(format: "%.2f", 35.6788)) EGP")
                        .padding(.bottom, 6)
                      //  .font(.callout)
                       
                
                    
                    
                }
                

                
            }
            HStack {
                if !isSuppliers {
                    MediumButton(buttonLabel: "Add to cart", buttonIcon: "cart",color: Color.primaryTeal,
                                 action: {}).padding(.trailing,4)
                    
                    MediumButton(buttonLabel: "Suppliers", buttonIcon: "storefront",color: Color.darkGray, action: {}).padding(.leading,4)
                    
                   
                }else{
                    
                    Spacer().frame(width: UIScreen.main.bounds.width / 2)
                    
                    MediumButton(buttonLabel: "Add to cart", buttonIcon: "cart",color: Color.primaryTeal,
                                 action: {})
                    
                }
                    

            }

            

        
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        
//        .padding()
//        .background(Color.white)
//        .cornerRadius(15)
//        .shadow(radius: 2)
    }
}

#Preview {
    ProductCardView(isSuppliers: false)
}
