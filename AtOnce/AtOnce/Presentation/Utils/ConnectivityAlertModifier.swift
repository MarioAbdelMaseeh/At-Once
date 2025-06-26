//
//  ConnectivityAlertModifier.swift
//  AtOnce
//
//  Created by mac on 26/06/2025.
//


import SwiftUI

struct ConnectivityAlertModifier: ViewModifier {
    @EnvironmentObject var connectivityObserver: ConnectivityObserver
    @State private var showAlert = false

    func body(content: Content) -> some View {
        content
            .onChange(of: connectivityObserver.isConnected) { _ in
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(connectivityObserver.isConnected ? "Internet!" : "No Internet!"),
                    message: Text(connectivityObserver.isConnected
                                 ? "You're connected to the internet"
                                 : "Please check your connection"),
                    dismissButton: .default(Text("OK"))
                )
            }
    }
}
