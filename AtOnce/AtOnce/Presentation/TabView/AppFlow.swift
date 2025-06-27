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

enum OutOfTabDestination: Hashable, Equatable {

    case profile
    case store(id: Int)
    case profileInfo(CachedPharmacy)
    case noInternet
    case forgetPassword
    case verifyOPT(generatedOPT: String)
}
