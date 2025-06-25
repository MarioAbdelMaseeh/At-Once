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

    let container: Resolver
    let isLoggedIn: Bool?
    init(container: Resolver = AppDIContainer.shared.container) {
        self.container = container
        self.isLoggedIn = container.resolve(CachePharmacyUseCase.self)?.isUserLoggedin()
        if let isLoggedIn = isLoggedIn{
            flow = isLoggedIn ? .main : .login
        }
    }

    func buildView(for destination: OutOfTabDestination) -> some View {
        switch destination {
        case .profile:
            let vm = container.resolve(ProfileViewModelProtocol.self)! as! ProfileViewModel
            return ProfileView(viewModel: vm){
                self.logout()
            }
        }
    }
    func logout() {
            path = []
        DispatchQueue.main.async {
                self.flow = .login
            }
        }
}
