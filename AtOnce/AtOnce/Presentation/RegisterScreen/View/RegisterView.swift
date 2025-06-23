//
//  RegisterView.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//

import SwiftUI
import CodeScanner

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
    
    @State private var selectedGovernorateName: String = ""
    @State private var selectedGovernorateId: Int?
    @State private var selectedAreaName: String = ""
    
    @StateObject var viewModel: RegisterViewModel
    
    @State var showErrorAlert : Bool = false
    
    @State private var isShowingScanner = false  // Add this
    
    init() {
        _viewModel = StateObject(wrappedValue: AppDIContainer.shared.container.resolve(RegisterViewModelProtocol.self)! as! RegisterViewModel)
    }
    
    private func governorateId(for name: String) -> Int? {
        viewModel.governorateList.first(where: { $0.name == name })?.id
    }
    
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
                    selectedOption: $selectedGovernorateName,
                    options: viewModel.governorateList.map { $0.name }
                ).onChange(of: selectedGovernorateName) { newName in
                    if let id = governorateId(for: newName) {
                        selectedGovernorateId = id
                        selectedAreaName = ""
                        viewModel.fetchAllAreasByGovernorateId(governorateId: id)
                    }
                }

                DropDownComponent(
                    title: NSLocalizedString("area", comment: ""),
                    selectedOption: $selectedAreaName,
                    options: viewModel.areasList.map { $0.name }
                )
                .disabled(selectedGovernorateName.isEmpty)
                
                TextFieldComponent(
                    title: NSLocalizedString("address_details", comment: ""),
                    text: $addressDetails
                )
                
                QRCodeComponent(
                    title: NSLocalizedString("invitation_code", comment: ""),
                    qrCode: $qrCode,
                    onScanTapped: {
                        isShowingScanner = true
                    }
                )
                
                Spacer().frame(height: 16)
                
                if let errorMessage = viewModel.errorMessage {
                    //Spacer().frame(height: 16)
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                LargeButtonComponent(
                    label: NSLocalizedString("register", comment: "")
                ) {
                    viewModel.validateRegister(
                        username: username,
                        pharmacyName: pharmacyName,
                        password: password,
                        confirmPassword: confirmPassword,
                        email: email,
                        phone: phone,
                        addressDetails: addressDetails,
                        governorateName: selectedGovernorateName,
                        areaName: selectedAreaName,
                        qrCode: qrCode
                    )
                }
            }
            .padding()
        }
        .sheet(isPresented: $isShowingScanner) {
            #if targetEnvironment(simulator)
            // Fallback for Simulator
            VStack(spacing: 20) {
                Text("Simulator QR Test")
                    .font(.headline)

                Button("Use Test QR Code") {
                    // Simulate QR code result
                    qrCode = "SIMULATED-QR-CODE-1234"
                    isShowingScanner = false
                }
                
                Button("Cancel") {
                    isShowingScanner = false
                }
            }
            .padding()
            #else
            // Real camera scanner for device
            CodeScannerView(codeTypes: [.qr], completion: handleScan)
            #endif
        }
        .navigationTitle(NSLocalizedString("register_new_account", comment: ""))
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func handleScan(result: Result<ScanResult, ScanError>) {
            isShowingScanner = false
            switch result {
            case .success(let scan):
                qrCode = scan.string
            case .failure(let error):
                print("QR scan failed: \(error.localizedDescription)")
            }
        }
}


