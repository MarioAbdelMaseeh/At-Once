//
//  APIResponse.swift
//  AtOnce
//
//  Created by mac on 22/06/2025.
//


struct APIResponse<T: Decodable>: Decodable {
    let items: T
//    let status: Int?
//    let message: String?
}