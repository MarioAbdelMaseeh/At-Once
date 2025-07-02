//
//  CartCell.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//

import SwiftUI
import Shimmer

struct CartCell: View {
    var order: CartItem
    var isLoading: Bool = false
    var onDelete: () -> Void
    var onUpdate: (_ medicineId: Int, _ quantity: Int) -> Void
    @State var text: String = ""
    @EnvironmentObject var lang: LanguageManager
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
                    HStack {
                        Text(lang.currentLanguage == .arabic ? order.arabicMedicineName : order.englishMedicineName)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Spacer()
                        Button {
                            onDelete()
                        } label: {
                            Image(systemName: "trash")
                                .resizable()
                                .frame(width: 22, height: 25)
                                .tint(.red)
                        }.padding(.horizontal, 4)
                    }

                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
//                            let localizedDiscount = NumberFormatter.localizedString(from: NSNumber(value: order.discount), number: .none)

                            Text(String(format: NSLocalizedString("discount_format", comment: ""), order.discount.localizedDigits))
                                .font(.caption)
                                .foregroundColor(.primaryTeal)
                            
                            Text(String(format: NSLocalizedString("cost_per_item_label", comment: ""), order.priceBeforeDiscount.localizedDigits))
                                .font(.caption2)
                                .foregroundColor(.secondary)

                            let totalPrice: Double = Double(order.quantity) * order.priceAfterDiscount
                            Text(String(format: NSLocalizedString("total_label", comment: ""), totalPrice.localizedDigits))
                                .font(.callout)
                                .foregroundColor(.primary)
                        }

                        Spacer()

                        HStack(spacing: 8) {
                            Button {
                                if order.quantity > 1 {
                                    onUpdate(order.medicineId, order.quantity - 1)
                                }
                            } label: {
                                Image(systemName: "minus")
                                    .foregroundColor(.primary)
                                    .padding(8)
                                    .background(Color(.customBackground))
                            }
                            
//                            Text("\(order.quantity)")
                            TextField("", text: $text)
                                .keyboardType(.numberPad)
                                .frame(width: 20)
                                .multilineTextAlignment(.center)
                                .onSubmit {
                                    if let newQuantity = Int(text), newQuantity > 0 {
                                        onUpdate(order.medicineId, newQuantity)
                                    } else {
                                        text = "\(order.quantity)" 
                                    }
                                }.onAppear {
                                    text = "\(order.quantity)"
                                }
                                .onChange(of: order.quantity) {
                                    text = "\($0)"
                                }
                            Button {
                                onUpdate(order.medicineId, order.quantity + 1)
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
                    }
                    .padding(.bottom)
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.customBackground))
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            )
        }
        .redacted(reason: isLoading ? .placeholder : [])
        .shimmering(active: isLoading)
    }
}
