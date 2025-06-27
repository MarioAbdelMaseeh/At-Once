//
//  RestPasswordUseCase.swift
//  AtOnce
//
//  Created by mac on 27/06/2025.
//

import Combine

protocol ResetPasswordUseCase{
    func restPassword(email: String, OTP: String, newPassword: String, confirmPassword: String) -> AnyPublisher<UniversalResponse, Error>
}

class ResetPasswordUseCaseImpl: ResetPasswordUseCase{
    let authRepo: AuthRepository
    init(authRepo: AuthRepository) {
        self.authRepo = authRepo
    }
    
    func restPassword(email: String, OTP: String, newPassword: String, confirmPassword: String) -> AnyPublisher<UniversalResponse, Error>{
        authRepo.restPassword(email: email, OTP: OTP, newPassword: newPassword, confirmPassword: confirmPassword)
    }
}
