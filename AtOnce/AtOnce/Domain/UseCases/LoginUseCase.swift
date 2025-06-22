//
//  LoginUseCase.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 22/06/2025.
//

import Combine

protocol LoginUseCase {
    func execute(email: String, password: String) -> AnyPublisher<LoginResponse, Error>
}

class LoginUseCaseImpl: LoginUseCase {
    private let authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func execute(email: String, password: String) -> AnyPublisher<LoginResponse, Error> {
        authRepository.login(email: email, password: password)
    }
}
