//
//  GetAllGovernoratesUseCase.swift
//  AtOnce
//
//  Created by Adham Mohamed on 23/06/2025.
//

import Foundation
import Combine

protocol GetAllGovernoratesUseCase{
    func excute()-> AnyPublisher<[Governorate], Error>
}

class GetAllGovernoratesUseCaseUseCaseImpl: GetAllGovernoratesUseCase {

    let governorateRepository: GovernorateRepository
    
    init(governorateRepository: GovernorateRepository) {
        self.governorateRepository = governorateRepository
    }
    
    func excute()-> AnyPublisher<[Governorate], Error> {
        return governorateRepository.getAllGovernorates()
    }
    
}

