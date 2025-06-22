//
//  pharmacy.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 21/06/2025.
//

struct LoginResponse {
    let token: String
    let message: String
    let success: Bool
    let pharmacy: Pharmacy
}

struct Pharmacy {
    let id: Int
    let userName: String
    let name: String
    let email: String
    let address: String
    let governate: String
    let areaId: Int
    let phoneNumber: String
}
