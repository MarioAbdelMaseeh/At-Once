//
//  NumberLocalization.swift
//  At Once
//
//  Created by mac on 20/06/2025.
//
import Foundation

//extension Numeric {
//    var localizedDigits: String {
//        let formatter = NumberFormatter()
//        formatter.locale = Locale.current
//        formatter.numberStyle = .decimal
//        formatter.maximumFractionDigits = 2
//        formatter.minimumFractionDigits = 2
//        return formatter.string(for: self) ?? "\(self)"
//    }
//}

extension Numeric {
    var localizedDigits: String {
        let lang = AppLanguageEnvironment.shared.currentLanguage
        let locale = lang.locale
        
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.string(for: self) ?? "\(self)"
    }
}



extension AppLanguage {
    
    var locale: Locale {
        switch self {
        case .english: return Locale(identifier: "en")
        case .arabic: return Locale(identifier: "ar_EG@numbers=arab") 
            
        case .system:
            let systemLangCode = Locale.preferredLanguages.first?.prefix(2) ?? "en"
            if systemLangCode == "ar" {
                return Locale(identifier: "ar_EG@numbers=arab")
            } else {
                return Locale(identifier: "en")
            }
            //        case .system:
//            let systemCode = Locale.preferredLanguages.first ?? "en"
//            return Locale(identifier: systemCode)
        }
    }
//    var locale: Locale {
//        switch self {
//        case .english: return Locale(identifier: "en")
//        case .arabic: return Locale(identifier: "ar")
//        case .system:
//            let systemCode = Locale.preferredLanguages.first ?? "en"
//            return Locale(identifier: systemCode)
//        }
//    }
}





///this work welllll //////////////////////
//extension Numeric {
//    func localizedDigits(locale: Locale = Locale.current) -> String {
//        let formatter = NumberFormatter()
//        
//        // Force Arabic-Indic digits if Arabic is selected
//        if locale.identifier == "ar" {
//            formatter.locale = Locale(identifier: "ar_EG@numbers=arab") // 👈 forces ٠١٢٣٤٥
//        } else {
//            formatter.locale = locale
//        }
//
//        formatter.numberStyle = .decimal
//        formatter.maximumFractionDigits = 2
//        formatter.minimumFractionDigits = 2
//        return formatter.string(for: self) ?? "\(self)"
//    }
//}


//extension Numeric {
//    func localizedDigits(locale: Locale = Locale.current) -> String {
//        let formatter = NumberFormatter()
//        formatter.locale = locale
//        formatter.numberStyle = .decimal
//        formatter.maximumFractionDigits = 2
//        formatter.minimumFractionDigits = 2
//        return formatter.string(for: self) ?? "\(self)"
//    }
//}




//extension Numeric {
//    func localizedDigits(using languageManager: AppLanguage) -> String {
//        let formatter = NumberFormatter()
//        
//        let localeIdentifier: String
//        switch languageManager {
//        case .arabic:
//            localeIdentifier = "ar"
//        case .english:
//            localeIdentifier = "en"
//        case .system:
//            localeIdentifier = Locale.preferredLanguages.first ?? "en"
//        }
//        
//        formatter.locale = Locale(identifier: localeIdentifier)
//        formatter.numberStyle = .decimal
//        formatter.maximumFractionDigits = 2
//        formatter.minimumFractionDigits = 2
//        return formatter.string(for: self) ?? "\(self)"
//    }
//}




//extension Numeric {
//    func localizedDigits(language: AppLanguage) -> String {
//        let formatter = NumberFormatter()
//        
//        switch language {
//        case .arabic:
//            formatter.locale = Locale(identifier: "ar")
//        case .english:
//            formatter.locale = Locale(identifier: "en")
//        case .system:
//            formatter.locale = Locale.current
//        }
//        
//        formatter.numberStyle = .decimal
//        formatter.maximumFractionDigits = 2
//        formatter.minimumFractionDigits = 2
//        return formatter.string(for: self) ?? "\(self)"
//    }
//}




//extension Numeric {
//    var localizedDigits: String {
//        let formatter = NumberFormatter()
//        formatter.locale = AppLanguage.current.locale // <-- this is the fix
//        formatter.numberStyle = .decimal
//        formatter.maximumFractionDigits = 2
//        formatter.minimumFractionDigits = 2
//        return formatter.string(for: self) ?? "\(self)"
//    }
//}



//
//extension Numeric {
//    var localizedDigits: String {
//        let formatter = NumberFormatter()
//        formatter.locale = Locale(identifier: Bundle.currentLanguageCode)
//        formatter.numberStyle = .decimal
//        formatter.maximumFractionDigits = 2
//        formatter.minimumFractionDigits = 2
//        return formatter.string(for: self) ?? "\(self)"
//    }
//}


extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}


