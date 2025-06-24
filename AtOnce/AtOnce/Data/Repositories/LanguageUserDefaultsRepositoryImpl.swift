//
//  LanguageUserDefaultsRepositoryImpl.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 24/06/2025.
//
// UserDefaultsRepositoryImpl.swift

import Foundation

final class LanguageUserDefaultsRepositoryImpl: LanguageUSerDefaultsRepository {
    
    private let defaults = UserDefaults.standard

    private enum Keys {
        static let language = "selected_language"
    }

    func setLanguage(_ language: AppLanguage) {
        defaults.set(language.rawValue, forKey: Keys.language)
    }

    func getLanguage() -> AppLanguage {
        if let rawValue = defaults.string(forKey: Keys.language),
           let language = AppLanguage(rawValue: rawValue) {
            return language
        }
        return .system
    }
}

