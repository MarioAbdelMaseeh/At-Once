//
//  GetCartByPharmacyId.swift
//  AtOnce
//
//  Created by Adham Mohamed on 24/06/2025.
//

import Foundation
import Combine

protocol GetCartByPharmacyIdUseCase{
    func excute(pharmacyId:Int)-> AnyPublisher<CartResponse,Error>
}

class GetCartByPharmacyIdUseCaseImpl: GetCartByPharmacyIdUseCase {

    let cartRepository: CartRepository
    
    init(cartRepository: CartRepository) {
        self.cartRepository = cartRepository
    }
    
    func excute(pharmacyId: Int) -> AnyPublisher<CartResponse, any Error> {
        return cartRepository.getCartByPharmacyId(pharmacyId: pharmacyId)
    }
    
}
