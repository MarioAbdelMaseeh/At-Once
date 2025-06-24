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
    func addToCart(cartBody: CartBodyDTO)-> AnyPublisher<AddToCartResponseDTO, Error>{
        return networkService.request(_request: CartAPI.addToCart(cartBody: cartBody), responseType: AddToCartResponseDTO.self).eraseToAnyPublisher()
    }
    
}
