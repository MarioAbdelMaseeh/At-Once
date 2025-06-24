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
        
        self.register((ProfileViewModelProtocol).self) { r in
            ProfileViewModel(cacheUseCase: r.resolve(CachePharmacyUseCase.self)!)
        }
        
        self.register(GovernorateRepository.self) { r in
            GovernorateRepositoryImpl(networkService: r.resolve(NetworkServiceProtocol.self)!)
        }
        self.register(GetAllGovernoratesUseCase.self) { r in
            GetAllGovernoratesUseCaseUseCaseImpl(governorateRepository: r.resolve(GovernorateRepository.self)!)
        }
        self.register(AreaRepository.self) { r in
            AreaRepositoryImpl(networkService: r.resolve(NetworkServiceProtocol.self)!)
        }
        self.register(GetAllAreasByGovernorateIdUseCase.self) { r in
            GetAllAreasByGovernorateIdUseCaseImpl(areaRepository: r.resolve(AreaRepository.self)!)
        }
        
        self.register(RegisterUseCase.self) { r in
            RegisterUseCaseImpl(authRepository: r.resolve(AuthRepository.self)!)
        }
        
        self.register((RegisterViewModelProtocol).self) { r in
            RegisterViewModel(governoratesUseCase: r.resolve(GetAllGovernoratesUseCase.self)!, areasUseCase: r.resolve(GetAllAreasByGovernorateIdUseCase.self)!, registerUseCase: r.resolve(RegisterUseCase.self)!)
        }
    }
}
