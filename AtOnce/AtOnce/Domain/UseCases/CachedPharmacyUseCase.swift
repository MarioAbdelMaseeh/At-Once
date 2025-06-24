//
//  CachedPharmacyUseCase.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 23/06/2025.
//

protocol CachePharmacyUseCase{
    func cacheUser(user: CachedPharmacy)
    func getCachedUser()-> CachedPharmacy?
    func clearCachedUser()
    func isUserLoggedin()->Bool
}

class CachePharmacyUseCaseImpl: CachePharmacyUseCase{
    
    let userDefaultsRepo: UserDefaultsRepository
    init(userDefaultsRepo: UserDefaultsRepository) {
        self.userDefaultsRepo = userDefaultsRepo
    }
    func cacheUser(user: CachedPharmacy) {
        userDefaultsRepo.saveUser(user)
    }
    func getCachedUser()-> CachedPharmacy?{
        userDefaultsRepo.getUser()
    }
    func clearCachedUser() {
        userDefaultsRepo.clearAll()
    }
    
    func isUserLoggedin() -> Bool {
        userDefaultsRepo.isLoggedIn
    }
    
}
