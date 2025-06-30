//
//  OrderDIContainer.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 28/06/2025.
//
import Swinject

extension Container {
    func registerOrderByStatus() {
        self.register(OrderRepository.self) { r in
            OrderRepositoryImpl(networkService: r.resolve(NetworkServiceProtocol.self)!)
        }

        self.register(GetOrdersByStatusUseCase.self) { r in
            GetOrdersByStatusUseCaseImpl(repository: r.resolve(OrderRepository.self)!)
        }
        
        self.register((OrdersViewModelProtocol).self) { r in
            OrdersViewModel(ordersUseCase: r.resolve(GetOrdersByStatusUseCase.self)!,userDefaultsUseCase: r.resolve(CachePharmacyUseCase.self)!)
        }
    }
}
