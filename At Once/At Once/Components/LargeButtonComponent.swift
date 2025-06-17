//
//  RegisterButton.swift
//  At Once
//
//  Created by Iman Mahmoud on 16/06/2025.
//

import SwiftUI

struct LargeButtonComponent: View {
  let label:String
  let action: () -> Void
 
    
    var body: some View {
        
        Button(action: {
           action()
        }) {
            Text(label)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.primaryTeal)
                .cornerRadius(10)
        }
    }
}

#Preview {
    LargeButtonComponent(label: "login"){
        print("Login button tapped")
    }
}
