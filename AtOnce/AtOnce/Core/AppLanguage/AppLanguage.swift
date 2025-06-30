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






