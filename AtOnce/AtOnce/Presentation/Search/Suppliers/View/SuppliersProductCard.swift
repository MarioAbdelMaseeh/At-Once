//
//  SuppliersProductCard.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 23/06/2025.
//

import SwiftUI

struct SuppliersProductCard: View {
    
   // @EnvironmentObject var languageManager: LanguageManager
    
    let suppliersProduct: SuppliersProduct
    let isLoading: Bool
    let addToCart: (_ p: SuppliersProduct)->Void
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment:.top) {
//                Image(.icon)
//                    .resizable()
//                    .frame(width: 80, height: 80)
//                    .clipShape(.circle)
//                    .padding(.trailing, 8)
                
                VStack(alignment:.leading, spacing: 8){
                    Text(suppliersProduct.warehHouseName)
                        .font(.headline)
                        .lineLimit(2)
                        
                        
                    Text(String(format: NSLocalizedString("discount_format", comment: ""), suppliersProduct.discount.localizedDigits))
                        .foregroundColor(.primaryTeal)
                        .font(.subheadline)
                        .padding(.bottom, 2)
                        //.padding(.top, 1)
                    
                    
                    HStack{
                        Text(String(format: NSLocalizedString("price_format", comment: ""), suppliersProduct.medicinePrice.localizedDigits))
                            .font(.subheadline)
                        Text(String(format: NSLocalizedString("amount_only_format", comment: ""), suppliersProduct.finalPrice.localizedDigits))
                            .font(.subheadline)
                            .foregroundColor(Color(.red))
                                    .strikethrough()
                        
                    }
                }
            }
            HStack {
//                if !isSuppliers {
//                    MediumButton(buttonLabel: NSLocalizedString("add_to_cart", comment: ""), buttonIcon: "cart",color: Color.primaryTeal,
//                                 action: {}).padding(.trailing,4)
//                    
//                    MediumButton(buttonLabel: NSLocalizedString("suppliers", comment: ""), buttonIcon: "storefront",color: Color.darkGray, action: {
//                        showSheet.toggle()
//                    }).padding(.leading,4)
//                    
//                   
//                }else{
                    
                    Spacer().frame(width:( UIScreen.main.bounds.width / 2)-30)
                    
//                    GeometryReader { geometry in
//                        Spacer()
//                            .frame(width: geometry.size.width / 2)
//                    }
                    
                    MediumButton(
                        buttonLabel: NSLocalizedString("add_to_cart", comment: ""),
                        buttonIcon: "cart",color: Color.primaryTeal,
                                 action: {
                        addToCart(suppliersProduct)
                    },
                    isLoading: isLoading)
               // }
                    

            }

            

        
        }
        .padding()
        .background(Color(.customBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        
        
//        .sheet(isPresented: $showSheet) {
//            SupplierSheetView().padding(.top)
//                .presentationDetents([.medium, .fraction(0.85)])
//                .presentationDragIndicator(.visible)
//                .presentationCornerRadius(20)
//        }
                   
        
//        .padding()
//        .background(Color.white)
//        .cornerRadius(15)
//        .shadow(radius: 2)
    }
}

//#Preview {
//    SuppliersProductCard()
//}
