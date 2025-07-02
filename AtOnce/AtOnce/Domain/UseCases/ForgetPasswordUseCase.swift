//
//  ForgetPasswordUseCase.swift
//  AtOnce
//
//  Created by mac on 27/06/2025.
//

import Combine

protocol ForgetPasswordUseCase{
    func forgetPassword(email: String, OTP: String) -> AnyPublisher<UniversalResponse, Error>
}

class ForgetPasswordUseCaseImpl: ForgetPasswordUseCase{
    let authRepo: AuthRepository
    init(authRepo: AuthRepository) {
        self.authRepo = authRepo
    }
    func forgetPassword(email: String, OTP: String) -> AnyPublisher<UniversalResponse, any Error> {
        authRepo.forgetPassword(email: email, OTP: OTP)
    }
}
