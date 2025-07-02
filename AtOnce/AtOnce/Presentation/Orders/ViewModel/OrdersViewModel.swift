//
//  OrdersViewModel.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 28/06/2025.
//

import Foundation
import Combine

protocol OrdersViewModelProtocol {
    
    func fetchOrders(status: OrderStatus, pharmacyId: Int)
}


class OrdersViewModel: OrdersViewModelProtocol, ObservableObject {
    
    @Published var orders: [Order] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let getOrdersUseCase: GetOrdersByStatusUseCase
    private let userDefaultsUseCase: CachePharmacyUseCase
    @Published var cachedPharmacy : CachedPharmacy?
    
    private var cancellables = Set<AnyCancellable>()

    init(ordersUseCase: GetOrdersByStatusUseCase, userDefaultsUseCase: CachePharmacyUseCase ) {
        self.getOrdersUseCase = ordersUseCase
        self.userDefaultsUseCase = userDefaultsUseCase
        cachedPharmacy = userDefaultsUseCase.getCachedUser()
        
        fetchOrders( status: .ordered, pharmacyId: cachedPharmacy?.id ?? 2)
    }
    
    func fetchOrders(status: OrderStatus, pharmacyId: Int) {
        isLoading = true
        let statusCode = status.toInt
        
        getOrdersUseCase.execute(status: statusCode,pharmacyId: cachedPharmacy?.id ?? 2)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] response in
                self?.orders = response.items
            }
            .store(in: &cancellables)
    }
}

