//
//  LanguageUseCase.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 24/06/2025.
//

protocol LanguageUseCase {
    func set(_ language: AppLanguage)
    func get() -> AppLanguage
}

final class LanguageUseCaseImpl: LanguageUseCase {
    private let userDefaults: LanguageUSerDefaultsRepository

    init(userDefaults: LanguageUSerDefaultsRepository) {
        self.userDefaults = userDefaults
    }

    func set(_ language: AppLanguage) {
        userDefaults.setLanguage(language)
    }

    func get() -> AppLanguage {
        return userDefaults.getLanguage()
    }
}

