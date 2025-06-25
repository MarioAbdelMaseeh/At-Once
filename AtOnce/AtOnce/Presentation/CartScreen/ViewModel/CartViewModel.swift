//
//  CartViewModel.swift
//  AtOnce
//
//  Created by Adham Mohamed on 24/06/2025.
//

import Foundation
import Combine

protocol CartViewModelProtocol {
    func fetchCartByPharmacyId(pharmacyId:Int)
}

class CartViewModel: CartViewModelProtocol, ObservableObject {
    
    @Published var isLoading = false
    @Published var errorMessage: String?

    @Published var cartResponse: CartResponse?
    @Published var cartWarehousesList: [CartWarehouse] = []

    private var cancellables = Set<AnyCancellable>()

    let cartUseCase: GetCartByPharmacyIdUseCase
    
    init(cartUseCase: GetCartByPharmacyIdUseCase) {
        self.cartUseCase = cartUseCase
        fetchCartByPharmacyId(pharmacyId: 45)
    }

    func fetchCartByPharmacyId(pharmacyId:Int) {
        isLoading = true
        cartUseCase.excute(pharmacyId: pharmacyId) .sink { [weak self] completion in
            self?.isLoading = false
            if case let .failure(error) = completion {
                self?.errorMessage = error.localizedDescription
            }
        } receiveValue: { [weak self] cartResponse in
            self?.cartResponse = cartResponse
            
            self?.cartWarehousesList = cartResponse.data?.warehouses ?? []
            
        }.store(in: &cancellables)
    }


}

