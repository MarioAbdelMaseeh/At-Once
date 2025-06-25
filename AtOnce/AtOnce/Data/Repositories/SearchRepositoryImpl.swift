//
//  SearchRepositoryImpl.swift
//  AtOnce
//
//  Created by mac on 22/06/2025.
//

import Combine

class SearchRepositoryImpl: SearchRepository{
    
    let network: NetworkServiceProtocol
    init(network: NetworkServiceProtocol) {
        self.network = network
    }
    
    func getProductsByText(area: Int, text: String, page: Int, pageSize: Int) -> AnyPublisher<[SearchProduct], Error> {
        network.request(_request: SearchAPI.SearchByText(area: area, text: text, page: page, pageSize: pageSize), responseType: APIResponse<[SearchProductDTO]>.self)
            .map { $0.items.map({  $0.toEntity() })}.eraseToAnyPublisher()
    }
    
}
