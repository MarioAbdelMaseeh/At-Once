//
//  RootView.swift
//  AtOnce
//
//  Created by mac on 24/06/2025.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @StateObject private var coordinator = AppCoordinator()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            Group {
                switch coordinator.flow {
                case .login:
                    LoginScreen(
                        viewModel: coordinator.container.resolve(LoginScreenViewModelProtocol.self)! as! LoginScreenViewModel,
                        onLoginSuccess: {
                            withAnimation {
                                coordinator.flow = .main
                            }
                        }
                    ).environmentObject(coordinator.connectivityObserver)
                case .main:
                    MainTabView(
                        onLogout: {
                            withAnimation {
                                coordinator.flow = .login
                            }
                        },
                        onNavigateOutOfTabs: { destination in
                            coordinator.path.append(destination)
                        }
                    ).environmentObject(coordinator.connectivityObserver)
                }
            }//.environment(\.layoutDirection, layoutDirection(for: languageManager.currentLanguage))
            .navigationDestination(for: OutOfTabDestination.self) { destination in
                coordinator.buildView(for: destination)
            }
        }.environment(\.layoutDirection, layoutDirection(for: languageManager.currentLanguage))
         .environmentObject(languageManager)
         .environmentObject(coordinator)
        .tint(.primary)
        
    }
    private func layoutDirection(for language: AppLanguage) -> LayoutDirection {
        switch language {
        case .arabic:
            return .rightToLeft
        case .english, .system:
            return .leftToRight
        }
    }
}
