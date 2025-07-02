//
//  ProductMapper.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 21/06/2025.
//

extension WarehouseProductDTO{
    func toEntity()->WarehouseProduct{
        return WarehouseProduct(medicineId: medicineId ?? 1, arName: arabicMedicineName ?? "unknown", enName: englishMedicineName ?? "unknown", quantity: quantity ?? 0 , prePrice: price ?? 0, pricePerItem: price ?? 0, discount: discount ?? 0, imageUrl: ((medicineUrl?.isEmpty) != nil) ? "https://www.sciencepharma.com/wp-content/uploads/2024/09/forms_drugs_baner_rf-scaled.jpg" : medicineUrl ?? "https://www.sciencepharma.com/wp-content/uploads/2024/09/forms_drugs_baner_rf-scaled.jpg")
    }
}
