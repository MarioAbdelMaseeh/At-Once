//
//  RegisterRequestDTO.swift
//  AtOnce
//
//  Created by Adham Mohamed on 24/06/2025.
//

import Foundation

struct RegisterRequestDTO: Codable {
    let userName: String
    let name: String
    let email: String
    let password: String
    let confirmPassword: String
    let address: String
    let governate: String
    let areaId: Int
    let representativeCode: String
    let phoneNumber: String
}
