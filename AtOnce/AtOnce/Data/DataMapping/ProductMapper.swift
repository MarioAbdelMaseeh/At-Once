//
//  ProductMapper.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 21/06/2025.
//

extension ProductDTO{
    func toEntity()->ProductOrder{
        return ProductOrder(id: medicineId ?? 1, arName: arabicMedicineName ?? "unknown", enName: englishMedicineName ?? "unknown", quantity: quantity ?? 0 , prePrice: price ?? 0, pricePerItem: price ?? 0, discount: discount ?? 0, imageUrl: /*((medicineUrl?.isEmpty) != nil) ? "https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" :*/ medicineUrl ?? "https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
    }
}
