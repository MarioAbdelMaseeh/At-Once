//
//  WarehouseMapper.swift
//  At Once
//
//  Created by mac on 21/06/2025.
//

extension WarehouseDTO{
    func toEntity()->Warehouse{
        return Warehouse(id: self.id ?? 1, name: self.name ?? "", address: self.address ?? "", imageUrl: self.imageUrl ?? "https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", minimumPrice: self.minmumPrice ?? 300, delivaryRate: self.delivaryRate ?? "daily", governate: self.governate ?? "")
    }
}
