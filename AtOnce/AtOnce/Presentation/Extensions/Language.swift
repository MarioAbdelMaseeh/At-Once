//
//  Language.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 24/06/2025.
//

import Foundation
import ObjectiveC.runtime

private var bundleKey: UInt8 = 0

extension Bundle {
    private class LocalizedBundle: Bundle, @unchecked Sendable {
        override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
            if let bundle = objc_getAssociatedObject(self, &bundleKey) as? Bundle {
                return bundle.localizedString(forKey: key, value: value, table: tableName)
            }
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
    }

    static func setLanguage(_ language: AppLanguage) {
        let languageCode: String? = {
            switch language {
            case .system:
                return Locale.preferredLanguages.first?.components(separatedBy: "-").first
            case .english:
                return "en"
            case .arabic:
                return "ar"
            }
        }()

        guard let code = languageCode,
              let path = Bundle.main.path(forResource: code, ofType: "lproj"),
              let langBundle = Bundle(path: path) else {
            objc_setAssociatedObject(Bundle.main, &bundleKey, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            object_setClass(Bundle.main, Bundle.self)
            return
        }

        objc_setAssociatedObject(Bundle.main, &bundleKey, langBundle, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        object_setClass(Bundle.main, LocalizedBundle.self)
    }
}
