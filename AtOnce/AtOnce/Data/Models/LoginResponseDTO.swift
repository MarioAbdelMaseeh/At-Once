//
//  PharmacyDTO.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 21/06/2025.
//


struct LoginResponseDTO: Decodable {
    let token: String?
    let message: String
    let success: Bool
    let pharmacy: PharmacyDTO
}

struct PharmacyDTO : Decodable {
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
    let representativePhone: String
}


