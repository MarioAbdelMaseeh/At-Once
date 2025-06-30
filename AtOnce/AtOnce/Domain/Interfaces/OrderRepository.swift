//
//  OrderRepository.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 28/06/2025.
//

import Combine

protocol OrderRepository {
    func getOrdersByStatus(status: Int, pharmacyId: Int) -> AnyPublisher<OrderByStatusResponse, Error>
}
