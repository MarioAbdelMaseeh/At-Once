//
//  AddToCartUseCase.swift
//  AtOnce
//
//  Created by mac on 25/06/2025.
//

import Foundation
import Combine

protocol AddToCartUseCase{
    func excute(cartBody:CartBodyDTO)-> AnyPublisher<AddToCartResponseDTO,Error>
}

class AddToCartUseCaseImpl: AddToCartUseCase {

    let cartRepository: CartRepository
    
    init(cartRepository: CartRepository) {
        self.cartRepository = cartRepository
    }
    
    func excute(cartBody:CartBodyDTO)-> AnyPublisher<AddToCartResponseDTO,Error> {
        return cartRepository.addToCart(cartBody: cartBody).eraseToAnyPublisher()
    }
    
}
