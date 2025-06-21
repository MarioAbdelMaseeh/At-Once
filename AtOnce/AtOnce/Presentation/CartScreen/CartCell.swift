//
//  CartCell.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//

import SwiftUI

struct CartCell: View {
    @Binding var order: ProductOrder
    var delete: ()->Void = {}
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(.icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.trailing, 2)
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    HStack{
                        Text(order.arName)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Spacer()
                        Button {
                            delete()
                        } label: {
                            Image(systemName: "trash")
                                .resizable()
                                .frame(width: 22,height: 25)
                                .tint(.red)
                        }.padding(.horizontal,4)
                    }
                    
                    HStack(alignment: .bottom){
                        VStack(alignment: .leading){
                            
                            let localizedDiscount = NumberFormatter.localizedString(from: NSNumber(value: order.discount), number: .none)

                            Text(String(format: NSLocalizedString("discount_format", comment: ""), localizedDiscount))
                                .font(.caption)
                                .foregroundColor(.primaryTeal)
                            
                            Text(String(format: NSLocalizedString("cost_per_item_label", comment: ""), order.pricePerItem.localizedDigits))
                                .font(.caption2)
                                .foregroundColor(.secondary)

                            Text(String(format: NSLocalizedString("total_label", comment: ""), order.total.localizedDigits))
                                .font(.callout)
                                .foregroundColor(.primary)

                        }
                        
                        
                        Spacer()
                        HStack(spacing: 8) {
                            Button {
                                if order.quantity > 1 {
                                    order.quantity -= 1
                                }
                            } label: {
                                Image(systemName: "minus")
                                    .foregroundColor(.primary)
                                    .padding(8)
                                    .background(Color(.customBackground))
                                
                            }
                            
                            Text("\(order.quantity)")
                            
                            Button {
                                order.quantity += 1
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(.primary)
                                    .padding(8)
                                    .background(Color(.customBackground))
                            }
                        }
                        .background(Color(.customBackground))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.primaryTeal, lineWidth: 2)
                        )
                    }.padding(.bottom)
                    
                }
                Spacer()
                
            }
            .padding(.horizontal,8)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.customBackground))
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            )
            .frame(height:.infinity)
        }
    }
}
//#Preview {
//    CartCell( order:.constant(ProductOrder(name: "Order", quantity: 3, pricePerItem: 200, discount: 28))) {
//        
//    }
//}
