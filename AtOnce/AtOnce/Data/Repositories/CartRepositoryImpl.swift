//
//  CartRepositoryImpl.swift
//  AtOnce
//
//  Created by Adham Mohamed on 24/06/2025.
//

import Foundation
import Combine

class CartRepositoryImpl: CartRepository{
    
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getCartByPharmacyId(pharmacyId: Int) -> AnyPublisher<CartResponse, any Error> {
        return networkService.request(_request: CartAPI.getCartByPharmacyId(pharmacyId: pharmacyId), responseType: CartResponseDTO.self)
            .map {$0.toEntity()}
            .eraseToAnyPublisher()
    }
    func addToCart(cartBody: CartBodyDTO) -> AnyPublisher<CartMessageResponseDTO, Error>{
        return networkService.request(_request: CartAPI.addToCart(cartBody: cartBody), responseType: CartMessageResponseDTO.self).eraseToAnyPublisher()
    }
    
    func removeFromCart(pharmacyId: Int, warehouseId: Int, cartItemId: Int) -> AnyPublisher<DeletedProduct, Error> {
        return networkService.request(_request: CartAPI.deleteCartItem(pharmacyID: pharmacyId, warehouseId: warehouseId, cartItemId: cartItemId), responseType: DeletedProductResponseDTO.self)
            .map {$0.toEntity()}
            .eraseToAnyPublisher()
    }
    func updateCartItem(pharmacyId: Int, warehouseId: Int, medicineId: Int, quantity: Int) -> AnyPublisher<CartMessageResponseDTO, Error>{
        return networkService.request(_request: CartAPI.updateCartItem(pharmacyID: pharmacyId, warehouseId: warehouseId, medicineId: medicineId, quantity: quantity), responseType: CartMessageResponseDTO.self)
            .eraseToAnyPublisher()
    }
    func placeOrder(pharmacyId: Int, warehouseId: Int) -> AnyPublisher<CartMessageResponseDTO, Error>{
        return networkService.request(_request: CartAPI.placeOrder(pharmacyId: pharmacyId, warehouseId: warehouseId), responseType: CartMessageResponseDTO.self)
            .eraseToAnyPublisher()
    }
}
