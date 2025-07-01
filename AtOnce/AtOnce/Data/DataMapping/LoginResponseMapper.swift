//
//  PharmacyMapper.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 21/06/2025.
//

extension LoginResponseDTO{
    func toEntity() -> LoginResponse{
        LoginResponse(token: self.token, message: self.message, success: self.success,
                      pharmacy: Pharmacy(id: self.pharmacy.id ?? 0, userName: self.pharmacy.userName ?? "unknown", name: self.pharmacy.name ?? "unknown", email: self.pharmacy.email ?? "unknown",password: self.pharmacy.password ?? "unknown", address: self.pharmacy.address ??  "unknown", governate: self.pharmacy.governate ?? "unknown", areaId: self.pharmacy.areaId ?? 0, phoneNumber: self.pharmacy.phoneNumber ?? "unknown", representativeId: self.pharmacy.representativeId ?? 0, representativePhone: self.pharmacy.representativePhone ?? "unknown"))
    }
}


