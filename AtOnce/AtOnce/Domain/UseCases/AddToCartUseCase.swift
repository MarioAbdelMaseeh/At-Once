//
//  AddToCartUseCase.swift
//  AtOnce
//
//  Created by mac on 25/06/2025.
//

import Foundation
import Combine

protocol AddToCartUseCase{
    func excute(cartBody:CartBodyDTO)-> AnyPublisher<CartMessageResponseDTO,Error>
}

class AddToCartUseCaseImpl: AddToCartUseCase {

    let cartRepository: CartRepository
    
    init(cartRepository: CartRepository) {
        self.cartRepository = cartRepository
    }
    
    func excute(cartBody:CartBodyDTO)-> AnyPublisher<CartMessageResponseDTO,Error> {
        return cartRepository.addToCart(cartBody: cartBody).eraseToAnyPublisher()
    }
    
}
