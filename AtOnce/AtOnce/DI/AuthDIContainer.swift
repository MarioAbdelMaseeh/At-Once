//
//  AuthDIContainer.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 22/06/2025.
//

import Swinject

extension Container{
    func registerAuth(){
        self.register(AuthRepository.self) { r in
            AuthRepositoryImpl(networkService: r.resolve(NetworkServiceProtocol.self)!)
        }
        self.register(LoginUseCase.self) { r in
            LoginUseCaseImpl(authRepository: r.resolve(AuthRepository.self)!)
        }
        self.register((LoginScreenViewModelProtocol).self) { r in
            LoginScreenViewModel(useCase: r.resolve(LoginUseCase.self)!,cachePharmacyUseCase: r.resolve(CachePharmacyUseCase.self)!)
        }
        
        self.register(UserDefaultsRepository.self) { r in
            UserDefaultsRepositoryImpl()
        }
        
        self.register(CachePharmacyUseCase.self) { r in
            CachePharmacyUseCaseImpl(userDefaultsRepo: r.resolve(UserDefaultsRepository.self)!)
        }
    }
}
