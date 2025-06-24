//
//  RegisterResponseMapper.swift
//  AtOnce
//
//  Created by Adham Mohamed on 24/06/2025.
//

import Foundation

extension RegisterResponseDTO {
    func toEntity() -> RegisterResponse {
        return RegisterResponse(message: self.message, success: self.success)
    }
}
