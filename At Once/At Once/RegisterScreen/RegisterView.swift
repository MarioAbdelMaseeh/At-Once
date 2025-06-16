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
        ScrollView{
            VStack(alignment: .leading, spacing: 16){
                HStack(){
                    Button(action: {
                        
                    }) {
                        Image(systemName: "chevron.backward").foregroundStyle(Color.black)
                    }
                    Spacer()
                    Text("Register New Account").font(.title2)
                    Spacer()
                }
                Spacer().frame(height: 8)
                TextFieldComponent(title: "Username", text: $username)
                TextFieldComponent(title: "PharacyName", text: $pharmacyName)
                PasswordFieldComponent(title: "Password",isPasswordVisible: $isPasswordVisible, password: $password)
                PasswordFieldComponent(title: "ConfirmPassword",isPasswordVisible: $isConfirmPasswordVisible, password: $confirmPassword)
                TextFieldComponent(title: "Email", text: $email)
                TextFieldComponent(title: "Phone", text: $phone)
                DropDownComponent(title: "Governorate", selectedOption: $selectedCity, options: cities)
                DropDownComponent(title: "Area", selectedOption: $selectedArea, options: areas)
                TextFieldComponent(title: "Address Details", text: $addressDetails)
                QRCodeComponent(title: "Invitation Code", qrCode: $qrCode)
                Spacer().frame(height: 16)
                LargeButtonComponent(label: "Register") {
                    
                }
            }.padding()
        }
    }
}

#Preview {
    RegisterView()
}
