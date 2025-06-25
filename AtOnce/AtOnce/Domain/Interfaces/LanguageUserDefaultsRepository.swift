//
//  LAnguageUserDefaultsRepository.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 24/06/2025.
//

// UserDefaultsRepository.swift

protocol LanguageUSerDefaultsRepository {
    func setLanguage(_ language: AppLanguage)
    func getLanguage() -> AppLanguage
}
