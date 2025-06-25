//
//  SplashScreen.swift
//  AtOnceAdmin
//
//  Created by Adham Mohamed on 23/06/2025.
//

import Foundation
import SwiftUICore

struct SplashScreen: View {
    @State private var isActive: Bool = false
    let languageManager = AppDIContainer.shared.container.resolve(LanguageManager.self)!

    var body: some View {
        if isActive {
            RootView().environmentObject(languageManager)
        } else {
            VStack {
                Lottie(animationName: "Splash-Lottie")
                    .frame(width: 250, height: 250)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
    
}

