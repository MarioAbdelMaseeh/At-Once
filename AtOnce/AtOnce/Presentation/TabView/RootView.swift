//
//  RootView.swift
//  AtOnce
//
//  Created by mac on 24/06/2025.
//

import SwiftUICore
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
                    )

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
                    )
                }
            }
            .navigationDestination(for: OutOfTabDestination.self) { destination in
                coordinator.buildView(for: destination)
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
}

//struct RootView: View {
//    @StateObject private var coordinator = AppCoordinator()
//
//    var body: some View {
//        if coordinator.flow == .login {
//            LoginScreen(
//                viewModel: AppDIContainer.shared.container.resolve(LoginScreenViewModelProtocol.self) as! LoginScreenViewModel
//            ) {
//                withAnimation {
//                    coordinator.flow = .main
//                }
//            }
//        } else {
//            MainTabView {
//                withAnimation {
//                    coordinator.flow = .login 
//                }
//            }
//        }
//    }
//}
