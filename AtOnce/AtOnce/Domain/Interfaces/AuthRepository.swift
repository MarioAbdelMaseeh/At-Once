//
//  AuthRepository.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 22/06/2025.
//

import Combine

protocol AuthRepository {
    func login(email: String, password: String) -> AnyPublisher<LoginResponse, Error>
    func registerRequest(request: RegisterRequestDTO) -> AnyPublisher<RegisterResponse, Error>
}
