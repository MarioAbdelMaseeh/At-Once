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
    func addToCart(cartBody: CartBodyDTO)-> AnyPublisher<AddToCartResponseDTO, Error>}
