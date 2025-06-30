//
//  AppFlow.swift
//  AtOnce
//
//  Created by mac on 24/06/2025.
//


enum AppFlow {
    case login
    case main
}

enum OutOfTabDestination: Hashable, Equatable, Codable {

    case profile
    case store(id: Int)
    case register
    case profileInfo(CachedPharmacy)
    case noInternet
    case forgetPassword
    case verifyOPT(email: String, generatedOTP: String)
    case resetPassword(email: String, generatedOTP: String)
}
