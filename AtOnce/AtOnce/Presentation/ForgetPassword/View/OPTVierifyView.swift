//
//  OPTVierifyView.swift
//  AtOnce
//
//  Created by mac on 27/06/2025.
//

import SwiftUI

struct OTPVerifyView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @FocusState private var focusedField: Int?
    @State private var code: [String] = Array(repeating: "", count: 5)
    @State private var showAlert = false
    @State private var alertMessage = ""

    let email: String
    let generatedOTP: String

    init(email: String, generatedOTP: String) {
        self.email = email
        self.generatedOTP = generatedOTP
    }

    var body: some View {
        VStack(spacing: 24) {
            Spacer().frame(height: 40)

            Text("otp_check_title".localized)
                .font(.title2)
                .bold()

            Text(String(format: NSLocalizedString("otp_check_subtitle", comment: ""), email))
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)

            HStack(spacing: 12) {
                ForEach(0..<5, id: \.self) { index in
                    TextField("", text: $code[index])
                        .frame(width: 50, height: 55)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .focused($focusedField, equals: index)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .onChange(of: code[index]) { newValue in
                            if newValue.count > 1 {
                                code[index] = String(newValue.last!)
                            }
                            if !newValue.isEmpty {
                                if index < 4 {
                                    focusedField = index + 1
                                }
                            } else if index > 0 {
                                focusedField = index - 1
                            }
                        }
                }
            }

            Button(action: {
                let otp = code.joined()
                if generatedOTP == otp {
                    alertMessage = "otp_success".localized
                    showAlert = true
                    coordinator.loginPath.append(.resetPassword(email: email, generatedOTP: generatedOTP))
                } else {
                    alertMessage = "otp_invalid".localized
                    showAlert = true
                }
            }) {
                Text("verify_code_button".localized)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.primaryTeal.opacity(isCodeComplete ? 1 : 0.5))
                    .cornerRadius(10)
            }
            .disabled(!isCodeComplete)

            HStack {
                Text("otp_not_received".localized)
                Button("resend_email_button".localized) {
                    print("Resend OTP tapped")
                }
                .foregroundColor(.primaryTeal)
            }
            .font(.footnote)

            Spacer()
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
        .padding()
        .onAppear {
            focusedField = 0
        }
        .alert("otp_alert_title".localized, isPresented: $showAlert) {
            Button("ok_button".localized, role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }

    private var isCodeComplete: Bool {
        code.allSatisfy { $0.count == 1 }
    }
}

#Preview {
    OTPVerifyView(email: "mario@gmail.com", generatedOTP: "")
}



