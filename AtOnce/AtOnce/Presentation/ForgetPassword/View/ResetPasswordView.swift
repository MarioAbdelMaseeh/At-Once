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

            Text("reset_password_title".localized)
                .font(.title2)
                .bold()

            Spacer().frame(height: 8)

            Text( "reset_password_subtitle".localized)
                .font(.subheadline)
                .foregroundStyle(Color(.systemGray))

            Spacer().frame(height: 32)

            PasswordFieldComponent(
                title: "password_field_label".localized,
                isPasswordVisible: $isPasswordVisible,
                password: $password
            )

            Spacer().frame(height: 16)

            PasswordFieldComponent(
                title: "confirm_password_field_label".localized,
                isPasswordVisible: $isConfirmPasswordVisible,
                password: $confirmPassword
            )

            Spacer().frame(height: 32)

            LargeButtonComponent(label: "update_password_button".localized) {
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
        }
        .padding()
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
                title: Text(validationError != nil
                            ? "validation_error_title".localized
                            : (viewModel.errorMessage != nil
                               ? "error_title".localized
                               : "success_title".localized)),
                message: Text(validationError ?? viewModel.errorMessage ?? viewModel.successMessage ?? ""),
                dismissButton: .default(Text( "ok_button".localized))
            )
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    coordinator.loginPath.removeLast()
                }) {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text(NSLocalizedString("back", comment: ""))
                    }
                }
            }
        }
        .onReceive(viewModel.$successMessage) { message in
            if message != nil {
                coordinator.logout()
            }
        }
    }

    private func validateFields() -> Bool {
        if password.isEmpty || confirmPassword.isEmpty {
            validationError = "error_fill_fields".localized
            return false
        }

        if password.count < 8 {
            validationError = "error_password_length".localized
            return false
        }

        if password != confirmPassword {
            validationError = "error_passwords_mismatch".localized
            return false
        }

        return true
    }
}

#Preview {
    ResetPasswordView(viewModel: AppDIContainer.shared.container.resolve(ForgetPasswordViewModelProtocol.self) as! ForgetPasswordViewModel, generatedOTP: "", email: "")
}
