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
        formatter.locale = AppLanguage.current.locale
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.string(for: self) ?? "\(self)"
    }
}




extension Numeric {
    var localizedNumber: String {
        let formatter = NumberFormatter()
        formatter.locale = AppLanguage.current.locale
      //  formatter.numberStyle = .
       // formatter.maximumFractionDigits = 2
       // formatter.minimumFractionDigits = 2
        return formatter.string(for: self) ?? "\(self)"
    }
}

