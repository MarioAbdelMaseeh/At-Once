//
//  LoginView.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//


import SwiftUI

struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    let buttonLabel = "Login"

    var body: some View {
        NavigationStack {
            VStack/*(spacing: 20)*/ {
                //Spacer(minLength: 10)

                
                Image(.icon)
                    .resizable()
                    .frame(width: 120,height: 120,alignment: .center)
                   // .shadow(color: .green, radius: 10)
                    .clipShape(.circle)
    //                .padding(.top,40)

                VStack(spacing: 4) {
                    Text("Welcome to")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("At Once Pharma")
                        .font(.title2)
                        .fontWeight(.bold)
                }.padding(.bottom,32)

              
                TextFieldComponent(title: "Email", text: $email).padding(.bottom, 16)
                
               
                PasswordFieldComponent(title: "Password",isPasswordVisible: $isPasswordVisible, password: $password)

               
                HStack {
                    Spacer()
                    Button("Forget Password ?") {
                        // action
                    }
                    .foregroundColor(.primaryTeal)
                    .bold()
                    .font(.callout)
                }.padding(.bottom, 32)

                
                LargeButtonComponent(label: buttonLabel){
                    
                }

                Spacer().frame(height: 80)

                HStack(spacing: 4) {
                    Text("Don’t have an account yet ?")
                
                    NavigationLink(destination: RegisterView()) {
                        Text("Register here")
                            .foregroundColor(.primaryTeal)
                            .fontWeight(.semibold)
                    }
                }
                .font(.callout)
                
            
                    
                    
                   
                    
                    
                    
                    
                    
                
            }
            .padding()
        }
        
    }
}

#Preview {
    LoginScreen()
}
