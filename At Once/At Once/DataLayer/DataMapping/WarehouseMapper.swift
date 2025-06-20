//
//  WarehouseMapper.swift
//  At Once
//
//  Created by mac on 21/06/2025.
//

extension WarehouseDTO{
    func toWarehouseEntity()->Warehouse{
        return Warehouse(id: self.id, name: self.name, address: self.address, imageUrl: self.imageUrl ?? "", minimumPrice: self.minimumPrice, delivaryRate: self.delivaryRate ?? "daily", governate: self.governate)
    }
}
