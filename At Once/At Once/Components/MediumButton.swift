//
//  MediumButton.swift
//  At Once
//
//  Created by Iman Mahmoud on 16/06/2025.
//

import SwiftUI

struct MediumButton: View {
    let buttonLabel: String
    let buttonIcon: String
    let color : Color
    let action: () -> Void
    
    var body: some View {
        
        Button(action: {
            action()
        }) {
            
            HStack(alignment: .center) {
                Text(buttonLabel)
                    .font(.footnote)
                    .foregroundColor(.white)
                    //.padding(.horizontal)
                Image(systemName: buttonIcon)
                    .foregroundColor(.white)
                    
                    
                
            }.padding(.vertical)
            
            
          
        }
        .fontWeight(.semibold)
        .frame(maxWidth: .infinity)
        .background(color)
        .cornerRadius(10)
    }
}

#Preview {
    MediumButton(buttonLabel: "Add to cart", buttonIcon: "cart",color: Color.primaryTeal, action: { })
}
