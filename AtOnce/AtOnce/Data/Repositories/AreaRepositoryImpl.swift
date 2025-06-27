//
//  AreaRepositoryImpl.swift
//  AtOnce
//
//  Created by Adham Mohamed on 23/06/2025.
//

import Foundation
import Combine

class AreaRepositoryImpl: AreaRepository{
   
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getAllAreasByGovernorateId(governorateId:Int)-> AnyPublisher<[Area],Error>{
        return networkService.request(_request: AuthAPI.getAllAreasByGovernorateId(governorateId: governorateId), responseType: [AreaDTO].self)
            .map { $0.map { $0.toEntity() } }
            .eraseToAnyPublisher()
    }
    
}
