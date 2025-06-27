//
//  DeleteCartMApper.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 25/06/2025.
//

extension DeletedProductResponseDTO {
    func toEntity() -> DeletedProduct {
        return DeletedProduct(success: success ?? false, message: message ?? "unknown error")
    }
}
