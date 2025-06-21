//
//  WarehouseMapper.swift
//  At Once
//
//  Created by mac on 21/06/2025.
//

extension WarehouseDTO{
    func toEntity()->Warehouse{
        return Warehouse(id: self.id ?? 1, name: self.name ?? "", address: self.address ?? "", imageUrl: self.imageUrl ?? "https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=1024x1024&w=is&k=20&c=NQtm4v1Uzp2luv-6f3qORcq9pDtz2H56p8g9Xix8cY0=", minimumPrice: self.minmumPrice ?? 300, delivaryRate: self.delivaryRate ?? "daily", governate: self.governate ?? "")
    }
}
