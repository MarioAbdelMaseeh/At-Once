//
//  ProductRepositoryImpl.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 22/06/2025.
//

import Combine

class ProductRepositoryImpl: ProductRepository{
    
    
   
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func getProductsByWarehouseId(warehouseId: Int, page: Int, pageSize: Int) -> AnyPublisher<[ProductOrder], any Error> {
        return networkService.request(_request: ProductAPI.getProductsByWarehouse(warehouseId: warehouseId, page: page, pageSize: pageSize), responseType: APIResponse<[ProductDTO]>.self)
            .map {$0.items.map{$0.toEntity()}
            }.eraseToAnyPublisher()
    }
    
    func getSuppliersByProductId(areaId: Int, productId: Int) -> AnyPublisher<[SuppliersProduct], any Error> {
        return networkService
            .request(
                _request: ProductAPI.getSuppliersByProduct(areaId: areaId, productId: productId),
                responseType: [SuppliersProductDTO].self
            )
            .map { dtos in
                dtos.map { $0.toEntity() }
            }
            .eraseToAnyPublisher()
    }
    
    
}
