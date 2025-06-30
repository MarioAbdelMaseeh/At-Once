//
//  OrderRepositoryImpl.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 28/06/2025.
//

import Combine

class OrderRepositoryImpl: OrderRepository {
    let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func getOrdersByStatus(status: Int, pharmacyId: Int) -> AnyPublisher<OrderByStatusResponse, Error> {
        return networkService.request(
            _request: OrderAPI.getOrdersByStatus(status: status, pharmacyId: pharmacyId),
            responseType: OrderByStatusResponseDTO.self
        ).map { $0.toEntity() }
        .eraseToAnyPublisher()
    }
}
