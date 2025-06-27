//
//  ProductRepository.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 22/06/2025.
//

import Combine

protocol ProductRepository{
    func getProductsByWarehouseId(warehouseId: Int, page: Int, pageSize: Int, search: String)-> AnyPublisher<[WarehouseProduct],Error>
    
    func getSuppliersByProductId(areaId: Int, productId: Int)-> AnyPublisher<[SuppliersProduct],Error>
}

