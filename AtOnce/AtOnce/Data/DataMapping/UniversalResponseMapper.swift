//
//  RegisterResponseMapper.swift
//  AtOnce
//
//  Created by Adham Mohamed on 24/06/2025.
//

import Foundation

extension UniversalResponseDTO {
    func toEntity() -> UniversalResponse {
        return UniversalResponse(message: self.message, success: self.success)
    }
}
