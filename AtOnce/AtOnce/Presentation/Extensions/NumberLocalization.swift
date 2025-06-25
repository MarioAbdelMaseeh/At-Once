//
//  NumberLocalization.swift
//  At Once
//
//  Created by mac on 20/06/2025.
//
import Foundation

extension Numeric {
    var localizedDigits: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
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
