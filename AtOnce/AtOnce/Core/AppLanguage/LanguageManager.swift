//
//  LanguageManager.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 24/06/2025.
//

import Combine
import Foundation

class LanguageManager: ObservableObject {
    @Published var currentLanguage: AppLanguage {
        didSet {
            useCase.set(currentLanguage)

            if currentLanguage != .system {
                Bundle.setLanguage(currentLanguage)
            } else {
            
                Bundle.resetToSystem()
            }

            objectWillChange.send()
        }
    }

    private let useCase: LanguageUseCase

    init(useCase: LanguageUseCase) {
        self.useCase = useCase
        let saved = useCase.get()
        self.currentLanguage = saved

        if saved != .system {
            Bundle.setLanguage(saved)
        } else {
            Bundle.resetToSystem()
        }
    }

    func setLanguage(_ lang: AppLanguage) {
        currentLanguage = lang
    }
}


