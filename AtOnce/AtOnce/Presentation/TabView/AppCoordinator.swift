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

    init(container: Resolver = AppDIContainer.shared.container) {
        self.container = container
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
