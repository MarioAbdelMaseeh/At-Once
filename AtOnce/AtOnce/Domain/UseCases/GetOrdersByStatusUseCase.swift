//
//  GetOrdersByStatusUseCase.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 28/06/2025.
//

import Combine

protocol GetOrdersByStatusUseCase {
    func execute(status: Int, pharmacyId: Int) -> AnyPublisher<OrderByStatusResponse, Error>
}

class GetOrdersByStatusUseCaseImpl: GetOrdersByStatusUseCase {
    let repository: OrderRepository

    init(repository: OrderRepository) {
        self.repository = repository
    }

    func execute(status: Int, pharmacyId: Int) -> AnyPublisher<OrderByStatusResponse, Error> {
        repository.getOrdersByStatus(status: status, pharmacyId: pharmacyId)
    }
}
