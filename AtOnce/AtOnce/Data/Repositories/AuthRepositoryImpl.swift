//
//  AuthRepository.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 22/06/2025.
//

import Combine

class AuthRepositoryImpl: AuthRepository {
    
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func login(email: String, password: String) -> AnyPublisher<LoginResponse, Error> {
        return networkService.request(
            _request: AuthAPI.login(email: email, password: password),
            responseType: LoginResponseDTO.self
        )
        .map { $0.toEntity() }
        .eraseToAnyPublisher()
    }
    
    func registerRequest(request: RegisterRequestDTO) -> AnyPublisher<UniversalResponse, any Error> {
        return networkService.request(
            _request: AuthAPI.registerRequest(request: request), responseType: UniversalResponseDTO.self)
        .map { $0.toEntity() }
        .eraseToAnyPublisher()
    }
    
    func forgetPassword(email: String, OTP: String) -> AnyPublisher<UniversalResponse, any Error> {
        return networkService.request(_request: AuthAPI.forgetPassword(email: email, OTP: OTP), responseType: UniversalResponseDTO.self).map { $0.toEntity()}.eraseToAnyPublisher()
    }
    
    func restPassword(email: String, OTP: String, newPassword: String, confirmPassword: String) -> AnyPublisher<UniversalResponse, any Error> {
        return networkService.request(_request: AuthAPI.restPassword(email: email, OTP: OTP, newPassword: newPassword, confirmPassword: confirmPassword), responseType: UniversalResponseDTO.self)
            .map { $0.toEntity()}.eraseToAnyPublisher()
    }
    
    
}
