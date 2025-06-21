//
//  fetchProductByWarehouseIdUseCase.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 21/06/2025.
//
import Combine

protocol FetchProductByWarehouseIdUseCase{
    func excute(warehouseId: Int, page: Int, pageSize: Int)-> AnyPublisher<[ProductOrder],Error>
}

class FetchProductByWarehouseIdUseCaseImpl: FetchProductByWarehouseIdUseCase{
    let warehouseRepository: WarehouseRepository
    
    init(warehouseRepository: WarehouseRepository) {
        self.warehouseRepository = warehouseRepository
    }
    func excute(warehouseId: Int, page: Int, pageSize: Int) -> AnyPublisher<[ProductOrder],Error> {
        return warehouseRepository.getProductsByWarehouseId(warehouseId: warehouseId, page: page, pageSize: pageSize)
    }
    
}
