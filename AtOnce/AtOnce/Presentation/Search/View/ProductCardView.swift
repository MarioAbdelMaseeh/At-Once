//
//  MedicineCardView.swift
//  At Once
//
//  Created by Iman Mahmoud on 18/06/2025.
//

import SwiftUI

struct ProductCardView: View {
    let product: SearchProduct
    var hasSuppliers: Bool{
        product.distributorsCount != 0
    }
    var isSuppliersSheeet = false
    @State private var showSheet = false
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment:.top) {
                Image(.icon)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(.circle)
                    .padding(.trailing, 8)
                
                VStack(alignment:.leading, spacing: 8){
                    Text(product.medicineName)
                        .font(.headline)
                        .lineLimit(2)
                    
                    
                    Text(String(format: NSLocalizedString("discount_format", comment: ""), product.maximumDiscount.localizedDigits))
                        .foregroundColor(.primaryTeal)
                        .font(.subheadline)
                        .padding(.bottom, 2)
                    //.padding(.top, 1)
                    
                    //   Text("Price : \(String(format: "%.2f", price)) EGP")
                    Text(String(format: NSLocalizedString("price_format", comment: ""), product.finalPrice.localizedDigits))
                    
                    // .padding(.bottom, 4)
                        .font(.subheadline)
                }
            }
            HStack {
                if hasSuppliers {
                    MediumButton(buttonLabel: NSLocalizedString("add_to_cart", comment: ""), buttonIcon: "cart",color: Color.primaryTeal,
                                 action: {}).padding(.trailing,4)
                    
                    MediumButton(buttonLabel: NSLocalizedString("suppliers", comment: ""), buttonIcon: "storefront",color: Color.darkGray, action: {
                        showSheet.toggle()
                    }).padding(.leading,4)
                    
                    
                }else{
                    
                    Spacer().frame(width:( UIScreen.main.bounds.width / 2)-30)
                    
                    //                    GeometryReader { geometry in
                    //                        Spacer()
                    //                            .frame(width: geometry.size.width / 2)
                    //                    }
                    
                    MediumButton(buttonLabel: NSLocalizedString("add_to_cart", comment: ""), buttonIcon: "cart",color: Color.primaryTeal,
                                 action: {})
                    
                }
            }
        }
        .padding()
        .background(Color(.customBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        
        
        .sheet(isPresented: $showSheet) {
            SupplierSheetView().padding(.top)
                .presentationDetents([.medium, .fraction(0.85)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(20)
        }
        
        
        //        .padding()
        //        .background(Color.white)
        //        .cornerRadius(15)
        //        .shadow(radius: 2)
    }
}

//#Preview {
//    ProductCardView()
//}
