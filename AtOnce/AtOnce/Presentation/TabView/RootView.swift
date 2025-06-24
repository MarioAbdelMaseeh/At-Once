//
//  RootView.swift
//  AtOnce
//
//  Created by mac on 24/06/2025.
//

import SwiftUICore


struct RootView: View {
    @StateObject private var coordinator = AppCoordinator()

    var body: some View {
        if coordinator.flow == .login {
            LoginScreen(
                viewModel: AppDIContainer.shared.container.resolve(LoginScreenViewModelProtocol.self) as! LoginScreenViewModel
            ) {
                withAnimation {
                    coordinator.flow = .main
                }
            }
        } else {
            MainTabView {
                withAnimation {
                    coordinator.flow = .login 
                }
            }
        }
    }
}
