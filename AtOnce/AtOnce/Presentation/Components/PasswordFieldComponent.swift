//
//  PasswordFieldComponent.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//

import SwiftUI

struct PasswordFieldComponent: View {
    var title: String
    @Binding var isPasswordVisible: Bool
    @Binding var password: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .fontWeight(.semibold)
            
            HStack {
                if isPasswordVisible {
                    TextField("password", text: $password)
                } else {
                    SecureField("password", text: $password)
                }
                
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
    }
}

#Preview {
    PasswordFieldComponent(title: "Password",isPasswordVisible:.constant(false), password: .constant(""))
}

