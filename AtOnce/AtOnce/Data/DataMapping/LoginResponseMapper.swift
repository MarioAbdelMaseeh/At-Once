//
//  PharmacyMapper.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 21/06/2025.
//

extension LoginResponseDTO{
   func toEntity() -> LoginResponse{
       LoginResponse(token: self.token, message: self.message, success: self.success,
                     pharmacy: Pharmacy(id: self.pharmacy.id, userName: self.pharmacy.userName, name: self.pharmacy.name, email: self.pharmacy.email,password: self.pharmacy.password, address: self.pharmacy.address, governate: self.pharmacy.governate, areaId: self.pharmacy.areaId, phoneNumber: self.pharmacy.phoneNumber, representativeId: self.pharmacy.representativeId))
    }
}


