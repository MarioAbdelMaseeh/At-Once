//
//  OrdersByStatusMapper.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 28/06/2025.
//
extension OrderByStatusResponseDTO {
    func toEntity() -> OrderByStatusResponse {
        return OrderByStatusResponse(
            message: self.message ?? "",
            items: self.result?.items.map { $0.toEntity() } ?? []
        )
    }
}

extension OrderDTO {
    func toEntity() -> Order {
        return Order(
            orderId: orderId,
            quantity: quantity,
            totalPrice: totalPrice,
            wareHouseName: wareHouseName,
            status: status,
            createdAt: createdAt,
            wareHouseImage: wareHouseImage,
            orderDetails: details.map { $0.toEntity() }
        )
    }
}

extension OrderDetailsDTO {
    func toEntity() -> OrderDetail {
        return OrderDetail(
            arabicMedicineName: arabicMedicineName,
            medicineName: medicineName,
            quantity: quantity,
            totalPriceAfterDisccount: totalPriceAfterDisccount,
            totalPriceBeforeDisccount: totalPriceBeforeDisccount,
            medicinePrice: medicinePrice,
            medicineImage: medicineImage,
            discountAmount: discountAmount,
            discountPercentage: discountPercentage
        )
    }
}
