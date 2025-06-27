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
            Text("Forget Password").font(.title2)
                .bold()
            Spacer().frame(height: 8)
            Text("Please enter your email to reset password").font(.subheadline)
                .foregroundStyle(Color(.systemGray))
            Spacer().frame(height: 32)
            TextFieldComponent(title: "Your Email", textType: .emailAddress, text: $text)
            Spacer().frame(height: 32)
            LargeButtonComponent(label: "Reset Password") {
                viewModel.forgetPasswordRequest(email: text, OTP: viewModel.generatedOTP)
            }
            Spacer()
        }.padding()
            .alert(isPresented: Binding<Bool>(
                get: { viewModel.errorMessage != nil || viewModel.successMessage != nil },
                set: { _ in viewModel.errorMessage = nil; viewModel.successMessage = nil }
            )) {
                Alert(
                    title: Text(viewModel.errorMessage != nil ? "Error" : "Success"),
                    message: Text(viewModel.errorMessage ?? viewModel.successMessage ?? ""),
                    dismissButton: .default(Text("OK"))
                )
            }
            .onReceive(viewModel.$successMessage) { message in
                if message != nil {
                    coordinator.path.append(.verifyOPT(generatedOPT: viewModel.generatedOTP))
                }
            }
    }
}

//#Preview {
//    ForgetPasswordView()
//}
