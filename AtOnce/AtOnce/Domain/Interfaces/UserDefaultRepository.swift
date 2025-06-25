//
//  UserDefaultRepository.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 23/06/2025.
//

protocol UserDefaultsRepository {
    var isLoggedIn: Bool { get set }
    func saveUser(_ user: CachedPharmacy)
    func getUser() -> CachedPharmacy?
    func clearAll()
}
