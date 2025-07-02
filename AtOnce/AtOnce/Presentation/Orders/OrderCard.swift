//
//  OrderCard.swift
//  At Once
//
//  Created by Iman Mahmoud on 17/06/2025.
//

import SwiftUI

struct OrderCard: View {
    let order: Order
    let isExpanded: Bool
    let toggleExpand: () -> Void
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        VStack(alignment: .leading,spacing: 12) {
            HStack {
                Image(systemName: "storefront")
                    .foregroundColor(.primaryTeal)
                    .font(.system(size: 24))
                Text(order.wareHouseName)
                    .font(.headline)
                Text("id:# \(order.orderId)")
                    .font(.callout).padding(.leading,32)
                
                Spacer()
                Button(action: toggleExpand) {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.black)
                        .font(.system(size: 24))
                }
    
            }
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.primaryTeal)
                    .font(.system(size: 24))
                Text(order.createdAt.toLocalizedDateTime())
                    .font(.headline)
                
            }
    
    

            if isExpanded {
                                 
                Divider()

                ForEach(order.orderDetails) { item in
                    HStack {
                        Image(systemName: "asterisk")
                            .font(.caption)
                        Text(languageManager.currentLanguage == .arabic ? item.arabicMedicineName :  item.medicineName)
                        Spacer()
                        Text(String(
                            format: NSLocalizedString("items_format", comment: ""),
                            item.quantity.localizedNumber
                        ))
                        Text(String(format: NSLocalizedString("amount_only_format", comment: ""), item.totalPriceAfterDisccount.localizedDigits))
                            .foregroundColor(.primaryTeal)
                            .bold()
                    }
                    .font(.callout)
                }

                Divider()

                HStack {
                    Spacer()
                    Text(String(format: NSLocalizedString("total_label", comment: ""), order.totalPrice.localizedDigits))
                    
                        .font(.callout)
                        .foregroundColor(.red)
                        .bold()
                }
            }
        }
        .padding()
        .background(Color(.customBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        
    }
}
