//
//  GetAllAreasByGovernorateIdUseCase.swift
//  AtOnce
//
//  Created by Adham Mohamed on 23/06/2025.
//

import Foundation
import Combine

protocol GetAllAreasByGovernorateIdUseCase{
    func excute(governorateId:Int)-> AnyPublisher<[Area],Error>
}

class GetAllAreasByGovernorateIdUseCaseImpl: GetAllAreasByGovernorateIdUseCase {

    let areaRepository: AreaRepository
    
    init(areaRepository: AreaRepository) {
        self.areaRepository = areaRepository
    }
    
    func excute(governorateId:Int)-> AnyPublisher<[Area],Error>{
        return areaRepository.getAllAreasByGovernorateId(governorateId: governorateId)
    }
    
}
