//
//  AppCoordinator.swift
//  AtOnce
//
//  Created by mac on 24/06/2025.
//

import Combine
import Swinject
import SwiftUICore
import SwiftUI

class AppCoordinator: ObservableObject {
    enum Flow {
        case login
        case main
    }

    @Published var flow: Flow = .login
    @Published var loginPath: [OutOfTabDestination] = []
    @Published var mainPath: [OutOfTabDestination] = []

    let connectivityObserver = ConnectivityObserver()
    let container: Resolver
    let isLoggedIn: Bool?
    private var cancellables = Set<AnyCancellable>()

    init(container: Resolver = AppDIContainer.shared.container) {
        self.container = container
        self.isLoggedIn = container.resolve(CachePharmacyUseCase.self)?.isUserLoggedin()
        if let isLoggedIn = isLoggedIn {
            flow = isLoggedIn ? .main : .login
        }

        connectivityObserver.$isConnected
            .removeDuplicates()
            .sink { [weak self] connected in
                self?.handleConnectionChange(connected)
            }
            .store(in: &cancellables)
    }

    private func handleConnectionChange(_ connected: Bool) {
        switch flow {
        case .login:
            if connected {
                if loginPath.last == .noInternet {
                    loginPath.removeLast()
                }
            } else {
                guard loginPath.last != .noInternet else { return }
                loginPath.append(.noInternet)
            }
        case .main:
            if connected {
                if mainPath.last == .noInternet {
                    mainPath.removeLast()
                }
            } else {
                guard mainPath.last != .noInternet else { return }
                mainPath.append(.noInternet)
            }
        }
    }

    func buildView(for destination: OutOfTabDestination) -> some View {
        switch destination {
        case .profile:
            let vm = container.resolve(ProfileViewModelProtocol.self)! as! ProfileViewModel
            return AnyView(
                ProfileView(viewModel: vm) {
                    self.logout()
                }
                .environmentObject(connectivityObserver)
                .environmentObject(self)
                .environmentObject(AppDIContainer.shared.container.resolve(LanguageManager.self)!)
            )

        case .store(let id):
            let vm = container.resolve(StoreScreenViewModelProtocol.self)! as! StoreScreenViewModel
            return AnyView(
                StoreScreen(warehouseId: id, viewModel: vm)
                    .environmentObject(connectivityObserver)
            )

        case .profileInfo(let pharmacy):
            return AnyView(
                ProfileInfo(pharmacy: pharmacy)
                    .environmentObject(connectivityObserver)
            )

        case .noInternet:
            return AnyView(
                NoInternetView().environmentObject(connectivityObserver)
            )

        case .forgetPassword:
            let vm = container.resolve(ForgetPasswordViewModelProtocol.self)! as! ForgetPasswordViewModel
            return AnyView(
                ForgetPasswordView(viewModel: vm).environmentObject(self)
                    .environmentObject(connectivityObserver)
            )

        case .verifyOPT(email: let email, generatedOTP: let generatedOTP):
            return AnyView(
                OTPVerifyView(email: email, generatedOTP: generatedOTP).environmentObject(self)
                    .environmentObject(connectivityObserver)
            )

        case .resetPassword(email: let email, generatedOTP: let generatedOTP):
            let vm = container.resolve(ForgetPasswordViewModelProtocol.self)! as! ForgetPasswordViewModel
            return AnyView(
                ResetPasswordView(viewModel: vm, generatedOTP: generatedOTP, email: email).environmentObject(connectivityObserver)
            )
        case .register:
            return AnyView(
                RegisterView().environmentObject(connectivityObserver)
            )
        case .webView(url: let url, title: let title):
            return AnyView(
                WebViewScreen(url: url, title: title)
                    .environmentObject(connectivityObserver)
            )
        }
    }

    func logout() {
        loginPath = []
        mainPath = []
        DispatchQueue.main.async {
            self.flow = .login
        }
    }
}
