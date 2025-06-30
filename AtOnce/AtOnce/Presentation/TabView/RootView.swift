//
//  RootView.swift
//  AtOnce
//
//  Created by mac on 24/06/2025.
//

import SwiftUI

import SwiftUI

struct RootView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @StateObject private var coordinator = AppCoordinator()

    var body: some View {
        Group {
            switch coordinator.flow {
            case .login:
                NavigationStack(path: $coordinator.loginPath) {
                    LoginView(
                        viewModel: coordinator.container.resolve(LoginScreenViewModelProtocol.self)! as! LoginScreenViewModel,
                        onLoginSuccess: {
                            withAnimation {
                                coordinator.loginPath = [] // reset before switching
                                coordinator.flow = .main
                            }
                        }
                    )
                    .environmentObject(coordinator.connectivityObserver)
                    .navigationDestination(for: OutOfTabDestination.self) { destination in
                        coordinator.buildView(for: destination)
                    }
                }

            case .main:
                NavigationStack(path: $coordinator.mainPath) {
                    MainTabView(
                        onLogout: {
                            withAnimation {
                                coordinator.logout()
                            }
                        },
                        onNavigateOutOfTabs: { destination in
                            coordinator.mainPath.append(destination)
                        }
                    )
                    .environmentObject(coordinator.connectivityObserver)
                    .navigationDestination(for: OutOfTabDestination.self) { destination in
                        coordinator.buildView(for: destination)
                    }
                }
            }
        }
        .environment(\.layoutDirection, layoutDirection(for: languageManager.currentLanguage))
        .environmentObject(languageManager)
        .environmentObject(coordinator)
        .tint(.primary)
    }

    private func layoutDirection(for language: AppLanguage) -> LayoutDirection {
        switch language {
        case .arabic:
            return .rightToLeft
        case .english:
            return .leftToRight
        case .system:
            let systemLanguageCode = Locale.preferredLanguages.first?.prefix(2) ?? "en"
            return systemLanguageCode == "ar" ? .rightToLeft : .leftToRight
        }
    }

//    private func layoutDirection(for language: AppLanguage) -> LayoutDirection {
//        switch language {
//        case .arabic:
//            return .rightToLeft
//        case .english, .system:
//            return .leftToRight
//        }
//    }
}
