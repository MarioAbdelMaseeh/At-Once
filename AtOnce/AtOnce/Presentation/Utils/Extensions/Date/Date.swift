//
//  Date.swift
//  AtOnceAdmin
//
//  Created by Adham Mohamed on 22/06/2025.
//

import Foundation

extension String {
    func toLocalizedDateTime() -> String {
        let dateFormats = [
            "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ",
            "yyyy-MM-dd'T'HH:mm:ss.SSSSSSS",
            "yyyy-MM-dd'T'HH:mm:ss"
        ]

        var parsedDate: Date? = nil

        for format in dateFormats {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = format
            formatter.timeZone = TimeZone(secondsFromGMT: 0)

            if let date = formatter.date(from: self) {
                parsedDate = date
                break
            }
        }

        guard let date = parsedDate else {
            return self
        }

        let currentAppLang = AppLanguage.current
        let outputFormatter = DateFormatter()
        outputFormatter.locale = currentAppLang.locale
        outputFormatter.dateFormat = currentAppLang == .arabic ? "dd MMM yyyy - hh:mm a" : "MMM dd, yyyy - hh:mm a"
        outputFormatter.timeZone = .current

        return outputFormatter.string(from: date)
    }
}


