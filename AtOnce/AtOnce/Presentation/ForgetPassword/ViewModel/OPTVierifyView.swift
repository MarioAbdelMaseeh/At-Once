//
//  OPTVierifyView.swift
//  AtOnce
//
//  Created by mac on 27/06/2025.
//

import SwiftUI

struct OTPVerifyView: View {
    @FocusState private var focusedField: Int?
    @State private var code: [String] = Array(repeating: "", count: 5)
    let email: String
    let generatedOTP: String
    init( email: String, generatedOTP: String) {
        self.email = email
        self.generatedOTP = generatedOTP
    }
    var body: some View {
        VStack(spacing: 24) {
            Spacer().frame(height: 40)
            
            Text("Check your email")
                .font(.title2)
                .bold()
            
            Text("We sent a reset link to \(email)\nEnter 5 digit code that was mentioned in the email")
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
                            } else {
                                if index > 0 && code[index].isEmpty {
                                    focusedField = index - 1
                                }
                            }
                        }
                }
            }
            
            // Verify Button
            Button(action: {
                let otp = code.joined()
                print("Verify code: \(otp)")
            }) {
                Text("Verify Code")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.primaryTeal.opacity(isCodeComplete ? 1 : 0.5))
                    .cornerRadius(10)
            }
            .disabled(!isCodeComplete)
            
            // Resend
            HStack {
                Text("Haven’t got the email yet?")
                Button("Resend email") {
                    print("Resend OTP tapped")
                }
                .foregroundColor(.primaryTeal)
            }
            .font(.footnote)
            
            Spacer()
        }
        .padding()
        .onAppear {
            focusedField = 0
        }
    }
    
    private var isCodeComplete: Bool {
        code.allSatisfy { $0.count == 1 }
    }
}

#Preview {
    OTPVerifyView(email: "mario@gmail.com", generatedOTP: "")
}



