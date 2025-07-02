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
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(isSelected ? Color.primaryTeal : Color.customBackground)
            .foregroundColor(isSelected ? .customBackground : Color(.systemGray))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryTeal,lineWidth: 2 )
                   
                )
            
        
      
    }
}

#Preview {
    OrdersChip(title: "Ordered", isSelected: false)
}


