//
//  ForgetPasswordViewModel.swift
//  AtOnce
//
//  Created by mac on 27/06/2025.
//

import Combine

protocol ForgetPasswordViewModelProtocol{
    func forgetPasswordRequest(email: String, OTP: String)
    func restPasswordRequest(email: String, OTP: String, newPassword: String, confirmPassword: String)
}
class ForgetPasswordViewModel: ForgetPasswordViewModelProtocol, ObservableObject{
    @Published var errorMessage: String?
    @Published var successMessage: String?

    private let forgetPasswordUseCase: ForgetPasswordUseCase
    private let restPasswordUseCase: ResetPasswordUseCase
    private var cancellables = Set<AnyCancellable>()
    var generatedOTP: String = ""
    init(forgetPasswordUseCase: ForgetPasswordUseCase, restPasswordUseCase: ResetPasswordUseCase) {
        self.forgetPasswordUseCase = forgetPasswordUseCase
        self.restPasswordUseCase = restPasswordUseCase
        generateAndStoreOTP()
    }
    func forgetPasswordRequest(email: String, OTP: String){
        forgetPasswordUseCase.forgetPassword(email: email, OTP: OTP).sink { [weak self] completion in
            if case let .failure(error) = completion {
                self?.errorMessage = error.localizedDescription
            }
        } receiveValue: { [weak self] result in
            if result.success{
                self?.successMessage = result.message
            }else{
                self?.errorMessage = result.message
            }
        }.store(in: &cancellables)
    }
    func restPasswordRequest(email: String, OTP: String, newPassword: String, confirmPassword: String) {
        restPasswordUseCase.restPassword(email: email, OTP: OTP, newPassword: newPassword, confirmPassword: confirmPassword).sink { [weak self] completion in
            if case let .failure(error) = completion {
                self?.errorMessage = error.localizedDescription
            }
        } receiveValue: { [weak self] result in
            if result.success{
                self?.successMessage = result.message
            }else{
                self?.errorMessage = result.message
            }
        }.store(in: &cancellables)
    }
    func generateAndStoreOTP() {
        generatedOTP = String(Int.random(in: 10000...99999))
    }
}
