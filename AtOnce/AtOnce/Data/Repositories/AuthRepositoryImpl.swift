//
//  AuthRepository.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 22/06/2025.
//

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
}
