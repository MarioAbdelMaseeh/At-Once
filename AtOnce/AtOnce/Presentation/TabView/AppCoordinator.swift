//
//  AppCoordinator.swift
//  AtOnce
//
//  Created by mac on 24/06/2025.
//

import Combine
import Swinject
import SwiftUICore


class AppCoordinator: ObservableObject {
    enum Flow {
        case login
        case main
    }

    @Published var flow: Flow = .login
    @Published var path: [OutOfTabDestination] = []
    let connectivityObserver = ConnectivityObserver()
    let container: Resolver
    let isLoggedIn: Bool?
    private var cancellables = Set<AnyCancellable>()
    init(container: Resolver = AppDIContainer.shared.container) {
        self.container = container
        self.isLoggedIn = container.resolve(CachePharmacyUseCase.self)?.isUserLoggedin()
        if let isLoggedIn = isLoggedIn{
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
            if connected {
                if path.last == .noInternet {
                    path.removeLast()
                }
            } else {
                if path.last != .noInternet {
                    path.append(.noInternet)
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
                        .environmentObject(self)
                        .environmentObject(AppDIContainer.shared.container.resolve(LanguageManager.self)!)
                    )
        case .store(let id):
                let vm = container.resolve(StoreScreenViewModelProtocol.self)! as! StoreScreenViewModel
            return AnyView(
                        StoreScreen(warehouseId: id, viewModel: vm)
                    )
            
        case .profileInfo(let pharmacy):
                return AnyView(
                    ProfileInfo(pharmacy: pharmacy)
                )
        case .noInternet:
            return AnyView(
                NoInternetView()
            )
        }
    }
    
    func logout() {
            path = []
        DispatchQueue.main.async {
                self.flow = .login
            }
        }
}
