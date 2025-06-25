//
//  PlaceOrderUseCase.swift
//  AtOnce
//
//  Created by mac on 26/06/2025.
//

import Combine

protocol PlaceOrderUseCase{
    func placeOrder(pharmacyId: Int, warehouseId: Int) -> AnyPublisher<CartMessageResponseDTO, Error>
}

class PlaceOrderUseCaseImpl: PlaceOrderUseCase{
    let cartRepository: CartRepository
    
    init(cartRepository: CartRepository) {
        self.cartRepository = cartRepository
    }
    func placeOrder(pharmacyId: Int, warehouseId: Int) -> AnyPublisher<CartMessageResponseDTO, Error>{
        cartRepository.placeOrder(pharmacyId: pharmacyId, warehouseId: warehouseId)
    }
}
