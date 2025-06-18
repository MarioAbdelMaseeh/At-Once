//
//  OrdersChips.swift
//  At Once
//
//  Created by Iman Mahmoud on 18/06/2025.
//

import SwiftUI

struct OrdersChip: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        
        Text(title)
            .padding(12)
//            .padding(.horizontal, 12)
//            .padding(.vertical, 6)
            .background(isSelected ? Color.primaryTeal : Color.gray.opacity(0.2))
            .foregroundColor(isSelected ? .white : .black)
            .cornerRadius(8)
        
      
    }
}

#Preview {
    OrdersChip(title: "Ordered", isSelected: true)
}


