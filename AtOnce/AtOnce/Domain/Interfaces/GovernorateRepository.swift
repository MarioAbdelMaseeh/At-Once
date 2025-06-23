//
//  GovernorateRepository.swift
//  AtOnce
//
//  Created by Adham Mohamed on 23/06/2025.
//

import Foundation
import Combine

protocol GovernorateRepository{
    func getAllGovernorates()-> AnyPublisher<[Governorate],Error>
}
