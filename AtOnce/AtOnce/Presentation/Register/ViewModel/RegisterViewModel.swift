//
//  RegisterViewModel.swift
//  AtOnce
//
//  Created by Adham Mohamed on 23/06/2025.
//

import Foundation
import Combine

protocol RegisterViewModelProtocol {
    func fetchAllGovernorates()
    func fetchAllAreasByGovernorateId(governorateId: Int)
    func validateRegister(
        username: String,
        pharmacyName: String,
        password: String,
        confirmPassword: String,
        email: String,
        phone: String,
        addressDetails: String,
        governorateName: String,
        areaName: String,
        qrCode: String
    ) -> Bool
    func register(
        username: String,
        pharmacyName: String,
        password: String,
        confirmPassword: String,
        email: String,
        phone: String,
        addressDetails: String,
        governorateName: String,
        areaId: Int,
        areaName: String,
        qrCode: String
    )
}

class RegisterViewModel: RegisterViewModelProtocol, ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var showErrorAlert = false
    @Published var registerSuccess = false
    @Published var governorateList: [Governorate] = []
    @Published var areasList: [Area] = []

    private var cancellables = Set<AnyCancellable>()

    let governoratesUseCase: GetAllGovernoratesUseCase
    let areasUseCase: GetAllAreasByGovernorateIdUseCase
    let registerUseCase: RegisterUseCase

    init(governoratesUseCase: GetAllGovernoratesUseCase, areasUseCase: GetAllAreasByGovernorateIdUseCase, registerUseCase: RegisterUseCase) {
        self.governoratesUseCase = governoratesUseCase
        self.areasUseCase = areasUseCase
        self.registerUseCase = registerUseCase
        fetchAllGovernorates()
    }

    func fetchAllGovernorates() {
        isLoading = true
        governoratesUseCase.excute().sink { [weak self] completion in
            self?.isLoading = false
            if case let .failure(error) = completion {
                self?.errorMessage = error.localizedDescription
                self?.showErrorAlert = true
            }
        } receiveValue: { [weak self] governorates in
            self?.governorateList = governorates
        }.store(in: &cancellables)
    }

    func fetchAllAreasByGovernorateId(governorateId: Int) {
        isLoading = true
        areasUseCase.excute(governorateId: governorateId).sink { [weak self] completion in
            self?.isLoading = false
            if case let .failure(error) = completion {
                self?.errorMessage = error.localizedDescription
                self?.showErrorAlert = true
            }
        } receiveValue: { [weak self] areas in
            self?.areasList = areas
        }.store(in: &cancellables)
    }

    func validateRegister(
        username: String,
        pharmacyName: String,
        password: String,
        confirmPassword: String,
        email: String,
        phone: String,
        addressDetails: String,
        governorateName: String,
        areaName: String,
        qrCode: String
    ) -> Bool {
        if username.isEmpty || pharmacyName.isEmpty || password.isEmpty || confirmPassword.isEmpty || email.isEmpty || phone.isEmpty || addressDetails.isEmpty || governorateName.isEmpty || areaName.isEmpty {
            errorMessage = "All fields are required"
            showErrorAlert = true
            return false
        } else if !isValidEmail(email) {
            errorMessage = "Please enter a valid email address"
            showErrorAlert = true
            return false
        } else if password != confirmPassword {
            errorMessage = "Passwords do not match"
            showErrorAlert = true
            return false
        } else if qrCode.isEmpty {
            errorMessage = "Please scan your QR code"
            showErrorAlert = true
            return false
        }
        return true
    }

    func register(
        username: String,
        pharmacyName: String,
        password: String,
        confirmPassword: String,
        email: String,
        phone: String,
        addressDetails: String,
        governorateName: String,
        areaId: Int,
        areaName: String,
        qrCode: String
    ) {
        guard validateRegister(username: username, pharmacyName: pharmacyName, password: password, confirmPassword: confirmPassword, email: email, phone: phone, addressDetails: addressDetails, governorateName: governorateName, areaName: areaName, qrCode: qrCode) else {
            return
        }

        let dto = RegisterRequestDTO(
            userName: username,
            name: pharmacyName,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
            address: addressDetails,
            governate: governorateName,
            areaId: areaId,
            representativeCode: qrCode,
            phoneNumber: phone
        )

        isLoading = true
        registerUseCase.execute(request: dto)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                    self?.showErrorAlert = true
                }
            } receiveValue: { [weak self] response in
                if response.success {
                    self?.registerSuccess = true
                    self?.errorMessage = "Registration successful."
                } else {
                    self?.registerSuccess = false
                    self?.errorMessage = response.message
                }
                self?.showErrorAlert = true
            }
            .store(in: &cancellables)
    }

    private func isValidEmail(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
}
