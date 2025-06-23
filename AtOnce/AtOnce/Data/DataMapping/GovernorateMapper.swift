//
//  GovernorateMapper.swift
//  AtOnce
//
//  Created by Adham Mohamed on 23/06/2025.
//

import Foundation

extension GovernorateDTO{
    func toEntity()->Governorate{
        return Governorate(id: self.id, name: self.name)
    }
}
