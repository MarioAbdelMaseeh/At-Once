//
//  AreaRepository.swift
//  AtOnce
//
//  Created by Adham Mohamed on 23/06/2025.
//

import Foundation
import Combine

protocol AreaRepository{
    func getAllAreasByGovernorateId(governorateId:Int)-> AnyPublisher<[Area],Error>
}
