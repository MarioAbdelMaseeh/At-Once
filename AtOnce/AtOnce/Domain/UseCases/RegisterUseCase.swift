//
//  RegisterUseCase.swift
//  AtOnce
//
//  Created by Adham Mohamed on 24/06/2025.
//

import Foundation
import Combine

protocol RegisterUseCase {
    func execute(request: RegisterRequestDTO) -> AnyPublisher<RegisterResponse, any Error>
}

class RegisterUseCaseImpl: RegisterUseCase {
    private let authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func execute(request: RegisterRequestDTO) -> AnyPublisher<RegisterResponse, any Error> {
        authRepository.registerRequest(request: request)
    }
}
