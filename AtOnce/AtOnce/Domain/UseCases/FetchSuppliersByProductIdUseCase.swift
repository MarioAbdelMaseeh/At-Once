//
//  FetchSuppliersByProductIdUseCase.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 23/06/2025.
//

import Combine

protocol FetchSuppliersByProductIdUseCase{
    func excute(areaId: Int, productId: Int)-> AnyPublisher<[SuppliersProduct],Error>
}

class FetchSuppliersByProductIdUseCaseImpl: FetchSuppliersByProductIdUseCase{
   
    let productRepository: ProductRepository
    init(productRepository: ProductRepository) {
        self.productRepository = productRepository
    }
    
    func excute(areaId: Int, productId: Int) -> AnyPublisher<[SuppliersProduct],Error> {
        return productRepository.getSuppliersByProductId(areaId: areaId, productId: productId)
    }
}
