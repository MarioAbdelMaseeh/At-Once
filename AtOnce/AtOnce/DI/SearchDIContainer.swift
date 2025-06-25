//
//  SearchDIContainer.swift
//  AtOnce
//
//  Created by mac on 23/06/2025.
//

import Swinject

extension Container{
    func registerSearch(){
        self.register(SearchRepository.self) { r in
            SearchRepositoryImpl(network: r.resolve(NetworkServiceProtocol.self)!)
        }
        self.register(SearchUseCase.self) { r in
            SearchUseCaseImpl(repo: r.resolve(SearchRepository.self)!)
        }
        self.register((SearchViewModelProtocol).self) { r in
            SearchViewModel(useCase: r.resolve(SearchUseCase.self)!, addToCartUseCase: r.resolve(AddToCartUseCase.self)!, userDefaultsUseCase: r.resolve(CachePharmacyUseCase.self)!)
        }
    }
}
