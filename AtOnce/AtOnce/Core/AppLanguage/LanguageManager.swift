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
         //   useCase.saveLanguage(currentLanguage)
            useCase.set(currentLanguage)
            Bundle.setLanguage(currentLanguage)
            AppLanguageEnvironment.shared.currentLanguage = currentLanguage
            objectWillChange.send()
        }
    }

    private let useCase: LanguageUseCase

    init(useCase: LanguageUseCase) {
        self.useCase = useCase
       // let saved = useCase.getSavedLanguage()
        let saved = useCase.get()
        self.currentLanguage = saved
        AppLanguageEnvironment.shared.currentLanguage = saved
        Bundle.setLanguage(saved)
    }

    func setLanguage(_ lang: AppLanguage) {
        currentLanguage = lang
    }
}



//final class AppLanguageManager: ObservableObject {
//    @Published var currentLanguage: AppLanguage {
//        didSet {
//            Bundle.setLanguage(currentLanguage)
//            useCase.set(currentLanguage)
//        }
//    }
//
//    private let useCase: LanguageUseCase
//
//    init(useCase: LanguageUseCase) {
//        self.useCase = useCase
//        let saved = useCase.get()
//        self.currentLanguage = saved
//        Bundle.setLanguage(saved)
//    }
//}

