//
//  AreaMapper.swift
//  AtOnce
//
//  Created by Adham Mohamed on 23/06/2025.
//

import Foundation

extension AreaDTO{
    func toEntity()->Area{
        return Area(id: self.id, name: self.name)
    }
}
