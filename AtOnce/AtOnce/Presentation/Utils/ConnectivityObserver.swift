//
//  ConnectivityObserver.swift
//  AtOnce
//
//  Created by mac on 26/06/2025.
//


import Foundation
import Connectivity

final class ConnectivityObserver: ObservableObject {
    private var connectivity: Connectivity?
    @Published var isConnected: Bool = true

    init() {
        connectivity = Connectivity()
        connectivity?.startNotifier()
        connectivity?.whenConnected = { [weak self] _ in
            DispatchQueue.main.async {
                self?.isConnected = true
            }
        }
        connectivity?.whenDisconnected = { [weak self] _ in
            DispatchQueue.main.async {
                self?.isConnected = false
            }
        }
    }

    deinit {
        connectivity?.stopNotifier()
    }
}
