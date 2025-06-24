//
//  CartDIContainer.swift
//  AtOnce
//
//  Created by Adham Mohamed on 24/06/2025.
//

import Foundation
import Swinject

extension Container{
    func registerCart(){
        self.register(CartRepository.self) { r in
            CartRepositoryImpl(networkService: r.resolve(NetworkServiceProtocol.self)!)
        }
        self.register(GetCartByPharmacyIdUseCase.self) { r in
            GetCartByPharmacyIdUseCaseImpl(cartRepository: r.resolve(CartRepository.self)!)
        }
        self.register(AddToCartUseCase.self) { r in
            AddToCartUseCaseImpl(cartRepository: r.resolve(CartRepository.self)!)
        }
        self.register((CartViewModelProtocol).self) { r in
            CartViewModel(cartUseCase: r.resolve(GetCartByPharmacyIdUseCase.self)!)
        }
    }
}
