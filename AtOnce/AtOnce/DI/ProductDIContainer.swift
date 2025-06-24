//
//  ProductDIContainer.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 22/06/2025.
//
import Swinject

extension Container{
    func registerProduct(){
        self.register(ProductRepository.self) { r in
            ProductRepositoryImpl(networkService: r.resolve(NetworkServiceProtocol.self)!)
        }
        self.register(FetchProductByWarehouseIdUseCase.self) { r in
            FetchProductByWarehouseIdUseCaseImpl(productRepository: r.resolve(ProductRepository.self)!)
        }
        self.register((StoreScreenViewModelProtocol).self) { r in
            StoreScreenViewModel(useCase: r.resolve(FetchProductByWarehouseIdUseCase.self)!)
        }
        self.register(FetchSuppliersByProductIdUseCase.self) { r in
            FetchSuppliersByProductIdUseCaseImpl(productRepository: r.resolve(ProductRepository.self)!)
        }
        self.register((SuppliersScreenViewModelProtocol).self) { r in
            SuppliersScreenViewModel(useCase: r.resolve(FetchSuppliersByProductIdUseCase.self)!)
        }
        
    }
}
