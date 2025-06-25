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
    func deleteItem(pharmacyId:Int, warehouseId:Int, itemId:Int)
}

class CartViewModel: CartViewModelProtocol, ObservableObject {
    
    @Published var isLoading = false
    @Published var errorMessage: String?

    @Published var cartResponse: CartResponse?
    @Published var SuccessMessage: String?
    @Published var cartWarehousesList: [CartWarehouse] = []

    private var cancellables = Set<AnyCancellable>()

    let cartUseCase: GetCartByPharmacyIdUseCase
    let userDefaultUseCase: CachePharmacyUseCase
    let deleteCartUseCase: DeleteItemUseCase
    
    init(cartUseCase: GetCartByPharmacyIdUseCase, userDefaultUseCase: CachePharmacyUseCase, deleteCartUseCase: DeleteItemUseCase) {
        self.cartUseCase = cartUseCase
        self.userDefaultUseCase = userDefaultUseCase
        self.deleteCartUseCase = deleteCartUseCase
        fetchCartByPharmacyId(pharmacyId: userDefaultUseCase.getCachedUser()?.id ?? 0)
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
    
    func deleteItem(pharmacyId: Int, warehouseId: Int, itemId: Int) {
        isLoading = true
        deleteCartUseCase.excute(pharmacyId: pharmacyId, warehouseId: warehouseId, itemId: itemId)
            .sink { [weak self] completion in
            self?.isLoading = false
            if case let .failure(error) = completion {
                self?.errorMessage = error.localizedDescription
             
            }
        } receiveValue: { [weak self] response in
            if response.success {
                self?.SuccessMessage = response.message
                self?.fetchCartByPharmacyId(pharmacyId: pharmacyId)
                
            }
            else {
                self?.errorMessage = response.message
                self?.isLoading = false
            }
        }.store(in: &cancellables)
    }


}

