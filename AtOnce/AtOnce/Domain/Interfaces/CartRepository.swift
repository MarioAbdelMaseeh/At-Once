//
//  CartRepository.swift
//  AtOnce
//
//  Created by Adham Mohamed on 24/06/2025.
//

import Foundation
import Combine

protocol CartRepository {
    func getCartByPharmacyId(pharmacyId:Int)-> AnyPublisher<CartResponse,Error>
    func addToCart(cartBody: CartBodyDTO)-> AnyPublisher<CartMessageResponseDTO, Error>
    func removeFromCart(pharmacyId: Int,warehouseId: Int, cartItemId:Int)-> AnyPublisher<DeletedProduct, Error>
    func updateCartItem(pharmacyId: Int, warehouseId: Int, medicineId: Int, quantity: Int) -> AnyPublisher<CartMessageResponseDTO, Error>
    func placeOrder(pharmacyId: Int, warehouseId: Int) -> AnyPublisher<CartMessageResponseDTO, Error>
}
