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
            LoginScreenViewModel(useCase: r.resolve(LoginUseCase.self)!)
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
        self.register((RegisterViewModelProtocol).self) { r in
            RegisterViewModel(governoratesUseCase: r.resolve(GetAllGovernoratesUseCase.self)!, areasUseCase: r.resolve(GetAllAreasByGovernorateIdUseCase.self)!)
        }
    }
}
