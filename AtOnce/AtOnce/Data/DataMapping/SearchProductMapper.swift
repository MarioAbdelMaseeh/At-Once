//
//  SearchProductMapper.swift
//  AtOnce
//
//  Created by mac on 22/06/2025.
//

extension SearchProductDTO{
    func toEntity()->SearchProduct{
        SearchProduct(medicineId: self.medicineId, medicineName: self.medicineName, drug: self.drug, price: self.price, maximumwareHouseAreaName: self.maximumwareHouseAreaName, imageUrl: self.imageUrl, finalPrice: self.finalPrice, totalQuantity: self.totalQuantity, distributorsCount: self.distributorsCount, warehouseIdOfMaxDiscount: self.warehouseIdOfMaxDiscount, warehouseNameOfMaxDiscount: self.warehouseNameOfMaxDiscount, quantityInWarehouseWithMaxDiscount: self.quantityInWarehouseWithMaxDiscount, maximumDiscount: self.maximumDiscount, minmumPrice: self.minmumPrice)
    }
}
