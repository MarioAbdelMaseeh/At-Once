//
//  UpdateCartItemUseCase.swift
//  AtOnce
//
//  Created by mac on 25/06/2025.
//

import Combine

protocol UpdateCartItemUseCase{
    func excute(pharmacyId: Int, warehouseId: Int, medicineId: Int, quantity: Int) -> AnyPublisher<AddToCartResponseDTO, any Error>
}

class UpdateCartItemUseCaseImpl: UpdateCartItemUseCase{
    let cartRepository: CartRepository
    
    init(cartRepository: CartRepository) {
        self.cartRepository = cartRepository
    }
    
    func excute(pharmacyId: Int, warehouseId: Int, medicineId: Int, quantity: Int) -> AnyPublisher<AddToCartResponseDTO, any Error> {
        return cartRepository.updateCartItem(pharmacyId: pharmacyId, warehouseId: warehouseId, medicineId: medicineId, quantity: quantity)
    }
}
