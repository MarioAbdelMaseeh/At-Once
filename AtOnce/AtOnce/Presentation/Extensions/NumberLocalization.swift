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
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: Bundle.currentLanguageCode)
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.string(for: self) ?? "\(self)"
    }
}


extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
   

}
func localizedString(_ key: String, with value: String) -> String {
    NSLocalizedString(key, comment: "").replacingOccurrences(of: "%@", with: value)
}

func localizedText(_ key: String, _ value: String) -> String {
    let format = NSLocalizedString(key, comment: "")
    return format.replacingOccurrences(of: "%@", with: value)
}
