//
//  fetchProductByWarehouseIdUseCase.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 21/06/2025.
//
import Combine

protocol FetchProductByWarehouseIdUseCase{
    func excute(warehouseId: Int, page: Int, pageSize: Int, search: String, type: String)-> AnyPublisher<[WarehouseProduct],Error>
}

class FetchProductByWarehouseIdUseCaseImpl: FetchProductByWarehouseIdUseCase{
    let productRepository: ProductRepository
    
    init(productRepository: ProductRepository) {
        self.productRepository = productRepository
    }
    func excute(warehouseId: Int, page: Int, pageSize: Int, search: String,type: String) -> AnyPublisher<[WarehouseProduct],Error> {
        return productRepository.getProductsByWarehouseId(warehouseId: warehouseId, page: page, pageSize: pageSize, search: search, type: type)
    }
    
}
