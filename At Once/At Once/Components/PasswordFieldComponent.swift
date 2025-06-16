//
//  PasswordFieldComponent.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//

import SwiftUI

struct PasswordFieldComponent: View {
    @Binding var isPasswordVisible: Bool
    @Binding var password: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Password")
                .fontWeight(.semibold)
            
            HStack {
                if isPasswordVisible {
                    TextField("Password", text: $password)
                } else {
                    SecureField("Password", text: $password)
                }
                
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
        }
    }
}

#Preview {
    PasswordFieldComponent(isPasswordVisible:.constant(false), password: .constant(""))
}

