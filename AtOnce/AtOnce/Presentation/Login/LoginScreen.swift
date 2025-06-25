//
//  LoginView.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//


import SwiftUI

struct LoginScreen: View {
    @ObservedObject var viewModel: LoginScreenViewModel
    var onLoginSuccess: () -> Void
    
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false

    @State private var showSuccessAlert = false
    @State private var showFailureAlert = false

    let buttonLabel = NSLocalizedString("login", comment: "")
    
    init(viewModel: LoginScreenViewModel, onLoginSuccess: @escaping () -> Void) {
        self.viewModel = viewModel
        self.onLoginSuccess = onLoginSuccess
    }

    var body: some View {
        NavigationStack {
            VStack {
                Image(.icon)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(.circle)

                VStack(spacing: 4) {
                    Text("welcome_to")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("at_once_pharma")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .padding(.bottom, 32)

                TextFieldComponent(title: NSLocalizedString("email", comment: ""), text: $email)

                if let emailError = viewModel.emailError {
                    Text(emailError)
                        .foregroundColor(.red)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                PasswordFieldComponent(
                    title: NSLocalizedString("password", comment: ""),
                    isPasswordVisible: $isPasswordVisible,
                    password: $password
                )
                .padding(.top, 16)

                if let passwordError = viewModel.passwordError {
                    Text(passwordError)
                        .foregroundColor(.red)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                HStack {
                    Spacer()
                    Button("forget_password") {
                        // Handle forget password
                    }
                    .foregroundColor(.primaryTeal)
                    .bold()
                    .font(.callout)
                }
                .padding(.bottom, 32)

                LargeButtonComponent(label: buttonLabel) {
                    viewModel.login(email: email, password: password)
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
            .alert("Login Successful", isPresented: $showSuccessAlert) {
                Button("OK") {
                    onLoginSuccess()
                }
            } message: {
                Text("Welcome back!")
            }
            .alert("Login Failed", isPresented: $showFailureAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(viewModel.errorMessage ?? "Unknown error")
            }
        }
        .onReceive(viewModel.$loginSuccess) { success in
            if success == true {
                showSuccessAlert = true
            } else if success == false {
                showFailureAlert = true
            }
        }
    }
}
