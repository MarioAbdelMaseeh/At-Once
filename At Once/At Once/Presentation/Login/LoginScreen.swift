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
    let buttonLabel = NSLocalizedString("login", comment: "")

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
                    Text("welcome_to")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("at_once_pharma")
                        .font(.title2)
                        .fontWeight(.bold)
                }.padding(.bottom,32)

              
                TextFieldComponent(title: NSLocalizedString("email", comment: ""), text: $email).padding(.bottom, 16)
                
               
                PasswordFieldComponent(title:NSLocalizedString("password", comment: ""),isPasswordVisible: $isPasswordVisible, password: $password)

               
                HStack {
                    Spacer()
                    Button("forget_password") {
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
                    Text("no_account")
                
                    NavigationLink(destination: RegisterView()) {
                        Text("register_here")
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
