//
//  CartCell.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//

import SwiftUI

struct CartCell: View {
    var medecinName: String = "My Medecin"
    var medecinDiscount: Int = 28
    var itemCost: Double = 200.9
    var delete: ()->Void = {}
    @State var itemCount: Int = 3
    var totalCost: Double {
        Double(itemCount) * itemCost
    }
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
                    Text(medecinName)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Discount: \(medecinDiscount)%")
                        .font(.caption)
                        .foregroundColor(.primaryTeal)
                    
                    Text("Cost per item: \(String(format:"%.2f", itemCost)) EGP")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    
                    Text("Total: \(String(format:"%.2f", totalCost)) EGP")
                        .font(.callout)
                        .foregroundColor(.red)
                }
                Spacer()
                VStack(alignment: .trailing){
                    Button {
                        delete()
                    } label: {
                        Image(systemName: "trash")
                            .resizable()
                            .frame(width: 22,height: 25)
                            .tint(.red)
                    }.padding(.horizontal,4)
                    Spacer()
                    HStack(spacing: 8) {
                        Button {
                            if itemCount > 1 {
                                itemCount -= 1
                            }
                        } label: {
                            Image(systemName: "minus")
                                .foregroundColor(.red)
                                .padding(8)
                                .background(Color.white)
                                
                        }
                        
                        Text("\(itemCount)")
                
                        Button {
                            itemCount += 1
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.red)
                                .padding(8)
                                .background(Color.white)
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.primaryTeal, lineWidth: 2)
                    )
                }.padding(.bottom)
            }
            .padding(.horizontal,16)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.customBackground))
            )
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            .frame(height: 140)
        }
    }
}
#Preview {
    CartCell()
}
