//
//  HomeDIContainer.swift
//  AtOnce
//
//  Created by mac on 21/06/2025.
//
import Swinject

extension Container{
    
    func registerHome(){
        self.register(WarehouseRepository.self) { r in
            WarehouseRepositoryImpl(networkService: r.resolve(NetworkServiceProtocol.self)!)
        }
        self.register(GetWarehouseByAreaUseCase.self) { r in
            GetWarehouseByAreaUseCaseImpl(warehouseRepository: r.resolve(WarehouseRepository.self)!)
        }
        self.register((HomeScreenViewModelProtocol).self) { r in
            HomeScreenViewModel(useCase: r.resolve(GetWarehouseByAreaUseCase.self)!,userDefaultUseCase: r.resolve(CachePharmacyUseCase.self)!)
        }
        
    }
    
}
