//
//  Connectivity.swift
//  AtOnce
//
//  Created by mac on 27/06/2025.
//

import SwiftUI

extension View {
    func withConnectivityAlert() -> some View {
        self.modifier(ConnectivityAlertModifier())
    }
}
