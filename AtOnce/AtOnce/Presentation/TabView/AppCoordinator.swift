//
//  AppCoordinator.swift
//  AtOnce
//
//  Created by mac on 24/06/2025.
//

import Combine


final class AppCoordinator: ObservableObject {
    @Published var flow: AppFlow = .login

}
