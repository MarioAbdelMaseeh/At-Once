//
//  AppLanguage.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 24/06/2025.
//

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
