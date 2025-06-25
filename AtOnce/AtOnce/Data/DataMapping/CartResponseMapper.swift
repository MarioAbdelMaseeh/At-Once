//
//  CartResponseMapper.swift
//  AtOnce
//
//  Created by Adham Mohamed on 24/06/2025.
//

import Foundation

extension CartResponseDTO {
    func toEntity() -> CartResponse {
        return CartResponse(success: self.success, message: self.message, data: (self.data?.toEntity()))
    }
}

extension CartDataDTO {
    func toEntity() -> CartData {
        return CartData(totalQuantity: self.totalQuantity, totalPriceBeforeDisscount: self.totalPriceBeforeDisscount, totalPriceAfterDisscount: self.totalPriceAfterDisscount, warehouses: self.warehouses.map{$0.toEntity()})
    }
}

extension CartWarehouseDTO {
    func toEntity() -> CartWarehouse {
        let totalQuantity = items.reduce(0) { $0 + $1.quantity }
        let totalPriceBefore = items.reduce(0.0) { $0 + ($1.priceBeforeDiscount * Double($1.quantity)) }
        let totalPriceAfter = items.reduce(0.0) { $0 + ($1.priceAfterDiscount * Double($1.quantity)) }

        return CartWarehouse(
            warehouseId: self.warehouseId,
            warehouseUrl: self.warehouseUrl,
            warehouseName: self.name,
            minimumPrice: self.minWarehousePriceInPharmacyArea ?? 0.0,
            totalQuantity: totalQuantity,
            totalPriceBeforeDiscount: totalPriceBefore,
            totalPriceAfterDiscount: totalPriceAfter,
            items: self.items.map { $0.toEntity() },
        )
    }
}

extension CartItemDTO {
    func toEntity() -> CartItem {
        return CartItem(medicineId: self.medicineId, arabicMedicineName: self.arabicMedicineName, englishMedicineName: self.englishMedicineName, medicineUrl: self.medicineUrl, quantity: self.quantity, priceAfterDiscount: self.priceAfterDiscount, priceBeforeDiscount: self.priceBeforeDiscount, discount: self.discount)
    }
}
