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
    
    func validateRegister(username: String, pharmacyName: String, password: String, confirmPassword: String, email: String, phone: String, addressDetails: String, qrCode: String)
}

class RegisterViewModel: RegisterViewModelProtocol, ObservableObject {

    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    @Published var governorateList: [Governorate] = []

    private var cancellables = Set<AnyCancellable>()
    
    //private let useCase : RegisterUseCase
    
//    init(useCase: RegisterUseCase) {
//        self.useCase = useCase
//    }
    
    let governoratesUseCase: GetAllGovernoratesUseCase
    
    init(governoratesUseCase: GetAllGovernoratesUseCase) {
        self.governoratesUseCase = governoratesUseCase
        fetchAllGovernorates()
    }

    func fetchAllGovernorates() {
        isLoading = true
        
        governoratesUseCase.excute().sink { [weak self] completion in
            self?.isLoading = false
            if case let .failure(error) = completion{
                self?.errorMessage = error.localizedDescription
            }
        }receiveValue: { [weak self] governorates in
            self?.governorateList = governorates
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
        qrCode: String
    ) {
        if username.isEmpty || pharmacyName.isEmpty || password.isEmpty || confirmPassword.isEmpty || email.isEmpty || phone.isEmpty || addressDetails.isEmpty {
            errorMessage = "All fields are required"
        } else if !isValidEmail(email) {
            errorMessage = "Please enter a valid email address"
        } else if password != confirmPassword {
            errorMessage = "Passwords do not match"
        } else if qrCode.isEmpty {
            errorMessage = "Please scan your QR code"
        } else {
            errorMessage = nil
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: email)
    }

    
}
