//
//  ProductRepository.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 22/06/2025.
//

import Combine

protocol ProductRepository{
    func getProductsByWarehouseId(warehouseId: Int, page: Int, pageSize: Int)-> AnyPublisher<[ProductOrder],Error>
}

