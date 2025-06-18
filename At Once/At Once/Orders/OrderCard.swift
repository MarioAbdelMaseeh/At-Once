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

    var body: some View {
        VStack(alignment: .leading,spacing: 12) {
            HStack {
                Image(systemName: "storefront")
                    .foregroundColor(.primaryTeal)
                    .font(.system(size: 24))
                Text(order.pharmacyName)
                    .font(.headline)
                Text("id:# \(order.id)")
                    .font(.callout).padding(.leading,32)
                
                Spacer()
                Button(action: toggleExpand) {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.black)
                        .font(.system(size: 24))
                }//.padding(.trailing,8)
                
                
            }//.padding(.bottom, 8)
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.primaryTeal)
                    .font(.system(size: 24))
                Text(order.date)
                    .font(.headline)
                
                    
                
            }
    
    

            if isExpanded {
                
                Text(order.location)
                    .font(.callout)
                    .foregroundColor(Color(.systemGray))
                                 
                Divider()

                ForEach(order.items) { item in
                    HStack {
                        Image(systemName: "asterisk")
                            .font(.caption)
                        Text(item.name)
                        Spacer()
                        Text("\(item.quantity) items").padding(.trailing,8)
                        Text("\(Int(item.price)) EGP")
                            .foregroundColor(.primaryTeal)
                            .bold()
                    }
                    .font(.callout)
                }

                Divider()

                HStack {
                    Spacer()
                    Text("Total : \(Int(order.items.reduce(0) { $0 + $1.price })) EGP")
                        .font(.callout)
                        .foregroundColor(.red)
                        .bold()
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        
    }
}


#Preview {
    OrderCard(order:Order(id: "12345", pharmacyName: "UM Pharma", date: "25/05/2024 - 18:00 PM", location: "Zefta, Gharbia", items: Array(repeating: OrderItem(id: "5678",name: "Panadol Extra 600mg", quantity: 3, price: 150), count: 4)), isExpanded: true, toggleExpand: {})
}
