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
    @State private var selectedAreaId: Int?
    
    @StateObject var viewModel: RegisterViewModel
    @State private var isShowingScanner = false
    
    @State private var showAlert = false
    @Environment(\.dismiss) private var dismiss


    init() {
        _viewModel = StateObject(wrappedValue: AppDIContainer.shared.container.resolve(RegisterViewModelProtocol.self)! as! RegisterViewModel)
    }
    
    private func governorateId(for name: String) -> Int? {
        viewModel.governorateList.first(where: { $0.name == name })?.id
    }
    
    private func areaId(for name: String) -> Int? {
        viewModel.areasList.first(where: { $0.name == name })?.id
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
                ).onChange(of: selectedAreaName) { newName in
                    if let id = areaId(for: newName) {
                        selectedAreaId = id
                    }
                }
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
                
                LargeButtonComponent(
                    label: NSLocalizedString("register", comment: "")
                ) {
                    viewModel.register(
                        username: username,
                        pharmacyName: pharmacyName,
                        password: password,
                        confirmPassword: confirmPassword,
                        email: email,
                        phone: phone,
                        addressDetails: addressDetails,
                        governorateName: selectedGovernorateName,
                        areaId: selectedAreaId ?? 0,
                        areaName: selectedAreaName,
                        qrCode: qrCode
                    )
                }
            }
            .padding()
        }
        .sheet(isPresented: $isShowingScanner) {
            #if targetEnvironment(simulator)
            VStack(spacing: 20) {
                Text("Simulator QR Test")
                    .font(.headline)

                Button("Use Test QR Code") {
                    qrCode = "RJN73R"
                    isShowingScanner = false
                }
                
                Button("Cancel") {
                    isShowingScanner = false
                }
            }
            .padding()
            #else
            CodeScannerView(codeTypes: [.qr], completion: handleScan)
            #endif
        }
        .navigationTitle(NSLocalizedString("register_new_account", comment: ""))
        .navigationBarTitleDisplayMode(.inline)
        
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(viewModel.registerSuccess ? "Success" : "Error"),
                message: Text(viewModel.errorMessage ?? "An unknown error occurred."),
                dismissButton: .default(Text("OK")) {
                    if viewModel.registerSuccess {
                        dismiss()
                    }
                }
            )
        }
        .onReceive(viewModel.$showErrorAlert) { value in
            showAlert = value
        }
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
