//
//  SuppliersProductMapper.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 23/06/2025.
//

extension SuppliersProductDTO {
    func toEntity() -> SuppliersProduct {
        return SuppliersProduct( warehouseId: warehouseId ?? 0, warehHouseName: warehHouseName ?? "unknown", medicineId: medicineId ?? 0, medicineName: medicineName ?? "unknown", medicinePrice: medicinePrice ?? 0, warehouseImageUrl: warehouseImageUrl ?? "https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" , discount: discount ?? 0, finalPrice: finalPrice ?? 0, wareHouseAreaName: wareHouseAreaName ?? "unknown", quantity: quantity ?? 0)
    }
    
}
