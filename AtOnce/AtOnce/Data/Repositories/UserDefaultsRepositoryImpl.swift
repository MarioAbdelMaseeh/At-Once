//
//  UserDefaultsRepositoryImpl.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 23/06/2025.
//

import Foundation

final class UserDefaultsRepositoryImpl: UserDefaultsRepository{
    
    private let defaults = UserDefaults.standard

    private enum Keys {
        static let isLoggedIn = "is_logged_in"
        static let savedUser = "savedUser"
    }
    
    var isLoggedIn: Bool{
        get{ defaults.bool(forKey: Keys.isLoggedIn)}
        set{ defaults.set(newValue, forKey: Keys.isLoggedIn)}
    }
    
    func saveUser(_ user: CachedPharmacy) {
        if let encoded = try? JSONEncoder().encode(user) {
            defaults.set(encoded, forKey: Keys.savedUser)
        }
        isLoggedIn = true
    }
    func getUser() -> CachedPharmacy? {
        guard let data = defaults.data(forKey: Keys.savedUser) else {
            return nil
        }
        return try? JSONDecoder().decode(CachedPharmacy.self, from: data)
    }
    
    func clearAll() {
        defaults.removeObject(forKey: Keys.savedUser)
        isLoggedIn = false
    } 
}
