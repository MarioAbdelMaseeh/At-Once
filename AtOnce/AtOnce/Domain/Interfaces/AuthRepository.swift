//
//  AuthRepository.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 22/06/2025.
//

import Combine

protocol AuthRepository {
    func login(email: String, password: String) -> AnyPublisher<LoginResponse, Error>
    func registerRequest(request: RegisterRequestDTO) -> AnyPublisher<UniversalResponse, Error>
    func forgetPassword(email: String, OTP: String) -> AnyPublisher<UniversalResponse, Error>
    func restPassword(email: String, OTP: String, newPassword: String, confirmPassword: String) -> AnyPublisher<UniversalResponse, Error>
}
