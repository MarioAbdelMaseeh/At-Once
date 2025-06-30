//
//  pharmacy.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 21/06/2025.
//

import Foundation

struct LoginResponse: Codable {
    let token: String?
    let message: String
    let success: Bool
    let pharmacy: Pharmacy
}

struct Pharmacy: Codable {
    let id: Int
    let userName: String
    let name: String
    let email: String
    let password: String
    let address: String
    let governate: String
    let areaId: Int
    let phoneNumber: String
    let representativeId: Int
    var representativePhone: String
}
