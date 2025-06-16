//
//  LoginView.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//


import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    let buttonLabel = "Login"

    var body: some View {
        VStack/*(spacing: 20)*/ {
            Spacer(minLength: 50)

            // Circle logo
            Image(.icon)
                .resizable()
                .frame(width: 120,height: 120,alignment: .center)
                .shadow(color: .green, radius: 10)
                .clipShape(.circle)
//                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            
//            Circle()
//                .fill(Color.teal)
//                .frame(width: 120, height: 120)

            // Title
            VStack(spacing: 4) {
                Text("Welcome to")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("At Once Pharma")
                    .font(.title2)
                    .fontWeight(.bold)
            }

            // Email Field
            TextFieldComponent(title: "Email", text: $email)
            
            // Password Field
            PasswordFieldComponent(title: "Password",isPasswordVisible: $isPasswordVisible, password: $password)

            // Forgot password
            HStack {
                Spacer()
                Button("Forgot Password ?") {
                    // action
                }
                .foregroundColor(.primaryTeal)
                .font(.footnote)
            }

            
            LargeButtonComponent(label: buttonLabel){
                //login action
            }

            Spacer()

            HStack(spacing: 4) {
                Text("Don’t have an account yet ?")
                Button("Register here") {
                    
                }
                .foregroundColor(.primaryTeal)
                .fontWeight(.semibold)
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
