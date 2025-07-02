//
//  ForgetPasswordView.swift
//  AtOnce
//
//  Created by mac on 27/06/2025.
//

import SwiftUI

struct ForgetPasswordView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject var viewModel: ForgetPasswordViewModel
    @State var text: String = ""

    init(viewModel: ForgetPasswordViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: 64)

            Text("forget_password_title".localized)
                .font(.title2)
                .bold()

            Spacer().frame(height: 8)

            Text("forget_password_subtitle".localized)
                .font(.subheadline)
                .foregroundStyle(Color(.systemGray))

            Spacer().frame(height: 32)

            TextFieldComponent(
                title: "email_placeholder".localized,
                textType: .emailAddress,
                text: $text
            )

            Spacer().frame(height: 32)

            LargeButtonComponent(label: "reset_password_button".localized) {
                viewModel.forgetPasswordRequest(email: text, OTP: viewModel.generatedOTP)
            }

            Spacer()
        }
        .padding()
        .alert(isPresented: Binding<Bool>(
            get: { viewModel.errorMessage != nil || viewModel.successMessage != nil },
            set: { _ in
                viewModel.errorMessage = nil
                viewModel.successMessage = nil
            }
        )) {
            Alert(
                title: Text(viewModel.errorMessage != nil
                            ? "error_title".localized
                            : "success_title".localized),
                message: Text(viewModel.errorMessage ?? viewModel.successMessage ?? ""),
                dismissButton: .default(Text("ok_button".localized))
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
                coordinator.loginPath.append(.verifyOPT(email: text, generatedOTP: viewModel.generatedOTP))
            }
        }
    }
}

#Preview {
    ForgetPasswordView(viewModel: AppDIContainer.shared.container.resolve(ForgetPasswordViewModelProtocol.self) as! ForgetPasswordViewModel)
}
