//
//  AppLanguage.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 24/06/2025.
//

import Foundation


enum AppLanguage: String, CaseIterable {
    case system, english, arabic

    var displayName: String {
        switch self {
        case .system: return "System Default"
        case .english: return "English"
        case .arabic: return "العربية"
        }
    }
}


extension AppLanguage {
//    static var current: AppLanguage {
//        let storedRaw = UserDefaults.standard.string(forKey: "selected_language")
//        let selected = AppLanguage(rawValue: storedRaw ?? "system") ?? .system
//
//        if selected == .system {
//            let systemLangCode = Locale.preferredLanguages.first?.prefix(2) ?? "en"
//            return systemLangCode == "ar" ? .arabic : .english
//        } else {
//            return selected
//        }
//    }

//    var locale: Locale {
//        switch self {
//        case .english: return Locale(identifier: "en")
//        case .arabic: return Locale(identifier: "ar_EG@numbers=arab")
//        case .system:
//            return AppLanguage.current.locale // recursively resolve the real one
//        }
//    }
    
    static var current: AppLanguage {
           let storedRaw = UserDefaults.standard.string(forKey: "selected_language")
           return AppLanguage(rawValue: storedRaw ?? "system") ?? .system
       }
    
    
    var locale: Locale {
        switch self {
        case .english:
            return Locale(identifier: "en")
        case .arabic:
            return Locale(identifier: "ar_EG@numbers=arab")
        case .system:
            let systemLangCode = Locale.preferredLanguages.first?.prefix(2) ?? "en"
            return systemLangCode == "ar" ? Locale(identifier: "ar_EG@numbers=arab") : Locale(identifier: "en")
        }
    }

}



//taba3hom
//extension AppLanguage {
//    var locale: Locale {
//        switch self {
//        case .english: return Locale(identifier: "en")
//        case .arabic: return Locale(identifier: "ar_EG@numbers=arab") // 👈 Arabic with Arabic numerals
//        case .system:
//            let systemCode = Locale.preferredLanguages.first ?? "en"
//            return Locale(identifier: systemCode)
//        }
//    }
//}

///////////////////////////////////////////////////////////////////
//struct AppLanguageEnvironment {
//    static var shared = AppLanguageEnvironment()
//    
//    var currentLanguage: AppLanguage = .system
//}


//enum AppLanguage: String, CaseIterable {
//    case system, english, arabic
//
//    var displayName: String {
//        switch self {
//        case .system: return "System Default"
//        case .english: return "English"
//        case .arabic: return "العربية"
//        }
//    }
//
//    var locale: Locale {
//        switch self {
//        case .system:
//            return Locale(identifier: Locale.preferredLanguages.first ?? "en")
//        case .english:
//            return Locale(identifier: "en")
//        case .arabic:
//            return Locale(identifier: "ar")
//        }
//    }
//
//    static var current: AppLanguage {
//        switch Bundle.currentLanguageCode {
//        case "ar": return .arabic
//        case "en": return .english
//        default: return .system
//        }
//    }
//}

