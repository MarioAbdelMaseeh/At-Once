//
//  DeleteItemUseCase.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 25/06/2025.
//

import Foundation
import Combine

protocol DeleteItemUseCase{
    func excute(pharmacyId:Int,warehouseId:Int, itemId:Int)-> AnyPublisher<DeletedProduct,Error>
}

class DeleteItemUseCaseImpl: DeleteItemUseCase {
   
    let cartRepository: CartRepository
    
    init(cartRepository: CartRepository) {
        self.cartRepository = cartRepository
    }
    
    func excute(pharmacyId: Int, warehouseId: Int, itemId: Int) -> AnyPublisher<DeletedProduct, Error> {
        return cartRepository.removeFromCart(pharmacyId: pharmacyId, warehouseId: warehouseId, cartItemId: itemId)
    }
    
}
