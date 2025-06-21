//
//  Untitled.swift
//  At Once
//
//  Created by mac on 21/06/2025.
//
import Combine
protocol WarehouseRepository{
    func getWarehousesByArea(areaId: Int, page: Int, pageSize: Int)-> AnyPublisher<[Warehouse],Error>
    
    func getProductsByWarehouseId(warehouseId: Int, page: Int, pageSize: Int)-> AnyPublisher<[ProductOrder],Error>
}


