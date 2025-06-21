//
//  GetWarehouseByAreaUseCase.swift
//  At Once
//
//  Created by mac on 21/06/2025.
//

import Combine

protocol GetWarehouseByAreaUseCase{
    func excute(areaId: Int, page: Int, pageSize: Int)-> AnyPublisher<[Warehouse],Error>
}

class GetWarehouseByAreaUseCaseImpl: GetWarehouseByAreaUseCase{
    let warehouseRepository: WarehouseRepository
    init(warehouseRepository: WarehouseRepository) {
        self.warehouseRepository = warehouseRepository
    }
    func excute(areaId: Int, page: Int, pageSize: Int) -> AnyPublisher<[Warehouse],Error> {
        return warehouseRepository.getWarehousesByArea(areaId: areaId, page: page, pageSize: pageSize)
    }
}
