//
//  At_OnceApp.swift
//  At Once
//
//  Created by mac on 12/06/2025.
//

import SwiftUI

@main
struct At_OnceApp: App {
//    let languageManager = AppDIContainer.shared.container.resolve(LanguageManager.self)!

    
    var body: some Scene {
        WindowGroup {
//            RootView()
//                .environmentObject(languageManager)
            SplashScreen()
        }
    }
}
