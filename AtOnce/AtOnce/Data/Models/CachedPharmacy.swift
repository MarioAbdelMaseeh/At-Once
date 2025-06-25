//
//  CachedPharmacyDTO.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 23/06/2025.
//

struct CachedPharmacy: Codable , Equatable, Hashable{
    var id: Int
    var token: String
    var name: String
    var address: String
    var governate: String
    var email: String
    var areaId: Int
    var phone: String
    init(user: Pharmacy, token: String) {
        self.id = user.id
        self.token = token
        self.areaId = user.areaId
        self.name = user.name
        self.address = user.address
        self.governate = user.governate
        self.email = user.email
        self.phone = user.phoneNumber
        
    }
}
