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
                    title: Text(connectivityObserver.isConnected
                                ? "internet_title_connected".localized
                                : "internet_title_disconnected".localized),
                    message: Text(connectivityObserver.isConnected
                                  ? "internet_message_connected".localized
                                  : "internet_message_disconnected".localized),
                    dismissButton: .default(Text("ok_button".localized))
                )
            }
    }
}
