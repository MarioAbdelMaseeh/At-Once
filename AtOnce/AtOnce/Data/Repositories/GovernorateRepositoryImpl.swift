//
//  GovernorateRepositoryImpl.swift
//  AtOnce
//
//  Created by Adham Mohamed on 23/06/2025.
//

import Foundation
import Combine

class GovernorateRepositoryImpl: GovernorateRepository{
   
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getAllGovernorates()-> AnyPublisher<[Governorate],Error>{
        return networkService.request(_request: GovernorateAPI.getAllGovernorates, responseType: [GovernorateDTO].self)
            .map { $0.map { $0.toEntity() } }
            .eraseToAnyPublisher()
    }
    
}
    

