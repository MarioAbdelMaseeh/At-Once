//
//  LAnguageContainer.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 25/06/2025.
//
//import Swinject
//
//extension Container{
//    
//    func registerLanguage() {
//        
//        self.register(LanguageUserDefaultsRepository.self) { r in
//            LanguageUserDefaultsRepositoryImpl()
//        }
//        self.register(LanguageUseCase.self) { r in
//            LanguageUseCaseImpl(userDefaults: r.resolve(LanguageUserDefaultsRepository.self)!)
//        }
//        self.register(LanguageManager.self) { r in
//            LanguageManager(useCase: r.resolve(LanguageUseCase.self)!)
//        }.inObjectScope(.container) // shared instance
//    }
//}


import Swinject

extension Container{
    
    func registerLanguage() {
        self.register(LanguageUSerDefaultsRepository.self) { r in
            LanguageUserDefaultsRepositoryImpl()
        }
        self.register(LanguageUseCase.self) { r in
            LanguageUseCaseImpl(userDefaults: r.resolve(LanguageUSerDefaultsRepository.self)!)
        }
        self.register(LanguageManager.self) { r in
            LanguageManager(useCase: r.resolve(LanguageUseCase.self)!)
        }.inObjectScope(.container)
    }
    
}
