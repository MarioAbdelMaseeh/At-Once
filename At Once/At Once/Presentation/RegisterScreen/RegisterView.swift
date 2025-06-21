//
//  RegisterView.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//

import SwiftUI

struct RegisterView: View {
    @State var username: String = ""
    @State var pharmacyName: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State private var isPasswordVisible = false
    @State private var isConfirmPasswordVisible = false
    @State var email: String = ""
    @State var phone: String = ""
    @State var addressDetails: String = ""
    @State var qrCode: String = ""
    @State private var selectedCity = "Alexandria"
    let cities = ["Alexandria", "Cairo", "Giza", "Luxor", "Aswan"]
    @State var selectedArea = "Sidi Bishr"
    let areas = ["Sidi Bishr", "Smoha", "Miami", "Gleem"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                TextFieldComponent(
                    title: NSLocalizedString("username", comment: ""),
                    text: $username
                )
                
                TextFieldComponent(
                    title: NSLocalizedString("pharmacy_name", comment: ""),
                    text: $pharmacyName
                )
                
                PasswordFieldComponent(
                    title: NSLocalizedString("password", comment: ""),
                    isPasswordVisible: $isPasswordVisible,
                    password: $password
                )
                
                PasswordFieldComponent(
                    title: NSLocalizedString("confirm_password", comment: ""),
                    isPasswordVisible: $isConfirmPasswordVisible,
                    password: $confirmPassword
                )
                
                TextFieldComponent(
                    title: NSLocalizedString("email", comment: ""),
                    text: $email
                )
                
                TextFieldComponent(
                    title: NSLocalizedString("phone", comment: ""),
                    text: $phone
                )
                
                DropDownComponent(
                    title: NSLocalizedString("governorate", comment: ""),
                    selectedOption: $selectedCity,
                    options: cities
                )
                
                DropDownComponent(
                    title: NSLocalizedString("area", comment: ""),
                    selectedOption: $selectedArea,
                    options: areas
                )
                
                TextFieldComponent(
                    title: NSLocalizedString("address_details", comment: ""),
                    text: $addressDetails
                )
                
                QRCodeComponent(
                    title: NSLocalizedString("invitation_code", comment: ""),
                    qrCode: $qrCode
                )
                
                Spacer().frame(height: 16)
                
                LargeButtonComponent(
                    label: NSLocalizedString("register", comment: "")
                ) {
                    // Register button action
                }
            }
            .padding()
        }
        .navigationTitle(NSLocalizedString("register_new_account", comment: ""))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RegisterView()
}
