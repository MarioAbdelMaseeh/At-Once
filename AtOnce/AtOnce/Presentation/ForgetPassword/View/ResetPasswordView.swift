//
//  ResetPasswordView.swift
//  AtOnce
//
//  Created by mac on 30/06/2025.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject var viewModel: ForgetPasswordViewModel
    @State var password: String = ""
    @State var isPasswordVisible = false
    @State var confirmPassword: String = ""
    @State var isConfirmPasswordVisible = false
    @State private var validationError: String?
    var generatedOTP: String
    var email: String
    init(viewModel: ForgetPasswordViewModel, generatedOTP: String, email: String) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.generatedOTP = generatedOTP
        self.email = email
    }
    var body: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: 64)
            Text("Set a new password").font(.title2)
                .bold()
            Spacer().frame(height: 8)
            Text("Please enter your new password").font(.subheadline)
                .foregroundStyle(Color(.systemGray))
            Spacer().frame(height: 32)
            PasswordFieldComponent(title: "Password", isPasswordVisible: $isPasswordVisible, password: $password)
            Spacer().frame(height: 16)
            PasswordFieldComponent(title: "Confirm Password", isPasswordVisible: $isConfirmPasswordVisible, password: $confirmPassword)
            Spacer().frame(height: 32)
            LargeButtonComponent(label: "Update Password") {
                if validateFields() {
                    viewModel.restPasswordRequest(
                        email: email,
                        OTP: generatedOTP,
                        newPassword: password,
                        confirmPassword: confirmPassword
                    )
                }
            }
            Spacer()
        }.padding()
            .alert(isPresented: Binding<Bool>(
                get: {
                    viewModel.errorMessage != nil || viewModel.successMessage != nil || validationError != nil
                },
                set: { _ in
                    viewModel.errorMessage = nil
                    viewModel.successMessage = nil
                    validationError = nil
                }
            )) {
                Alert(
                    title: Text(validationError != nil ? "Validation Error" : (viewModel.errorMessage != nil ? "Error" : "Success")),
                    message: Text(validationError ?? viewModel.errorMessage ?? viewModel.successMessage ?? ""),
                    dismissButton: .default(Text("OK"))
                )
            }
            .onReceive(viewModel.$successMessage) { message in
                if message != nil {
                    coordinator.logout()
                }
            }
    }
    private func validateFields() -> Bool {
        if password.isEmpty || confirmPassword.isEmpty {
            validationError = "Please fill in all fields."
            return false
        }
        
        if password.count < 8 {
            validationError = "Password must be at least 8 characters."
            return false
        }
        
        if password != confirmPassword {
            validationError = "Passwords do not match."
            return false
        }
        
        return true
    }
}

#Preview {
    ResetPasswordView(viewModel: AppDIContainer.shared.container.resolve(ForgetPasswordViewModelProtocol.self) as! ForgetPasswordViewModel, generatedOTP: "", email: "")
}
