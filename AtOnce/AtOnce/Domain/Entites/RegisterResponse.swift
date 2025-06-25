//
//  RegisterResponse.swift
//  AtOnce
//
//  Created by Adham Mohamed on 24/06/2025.
//

import Foundation

struct RegisterResponse: Identifiable {
    let id = UUID()
    let message: String
    let success: Bool
}
