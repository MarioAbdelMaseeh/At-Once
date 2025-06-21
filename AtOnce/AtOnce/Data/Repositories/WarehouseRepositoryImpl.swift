//
//  Repo.swift
//  At Once
//
//  Created by mac on 19/06/2025.
//

import Combine

class WarehouseRepositoryImpl: WarehouseRepository{
   
    
    
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getWarehousesByArea(areaId: Int, page: Int, pageSize: Int) -> AnyPublisher<[Warehouse],Error> {
        return networkService.request(_request: WarehouseAPI.getWarehousesByArea(areaId: areaId, page: page, pageSize: pageSize), responseType: APIResponse<[WarehouseDTO]>.self)
            .map {$0.items.map{$0.toEntity()}
        }.eraseToAnyPublisher()
    }
    
    func getProductsByWarehouseId(warehouseId: Int, page: Int, pageSize: Int) -> AnyPublisher<[ProductOrder], any Error> {
        return networkService.request(_request: ProductAPI.getProductsByWarehouse(warehouseId: warehouseId, page: page, pageSize: pageSize), responseType: APIResponse<[ProductDTO]>.self)
            .map {$0.items.map{$0.toEntity()}
            }.eraseToAnyPublisher()
    }
}
