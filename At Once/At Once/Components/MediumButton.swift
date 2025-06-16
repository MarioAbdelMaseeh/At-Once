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
    
    var body: some View {
        
        Button(action: {
          
        }) {
            
            HStack(alignment: .center) {
                Text(buttonLabel)
                    .font(.footnote)
                    .foregroundColor(.white)
                
                                      
                    //.padding(.horizontal)
                Image(systemName: buttonIcon)
                    .foregroundColor(.white)
                    
                    
                
            }.padding()
            
            
          
        }
        .fontWeight(.semibold)
        .frame(maxWidth: .infinity)
        .background(Color.primaryTeal)
        .cornerRadius(10)
    }
}

#Preview {
    MediumButton(buttonLabel: "Add to cart", buttonIcon: "cart")
}
