//
//  CartViewModel.swift
//  AtOnce
//
//  Created by Adham Mohamed on 24/06/2025.
//

import Foundation
import Combine

protocol CartViewModelProtocol {
    func fetchCartByPharmacyId()
    func deleteItem(warehouseId:Int, itemId:Int)
    func updateItem(warehouseId: Int, medicineId: Int, quantity: Int)
}

class CartViewModel: CartViewModelProtocol, ObservableObject {
    
    @Published var isLoading = false
    @Published var errorMessage: String?

    @Published var cartResponse: CartResponse?
    @Published var successMessage: String?
    @Published var cartWarehousesList: [CartWarehouse] = []

    private var cancellables = Set<AnyCancellable>()
    var isfetching = false
    let cartUseCase: GetCartByPharmacyIdUseCase
    let userDefaultUseCase: CachePharmacyUseCase
    let deleteCartUseCase: DeleteItemUseCase
    let updateCartItemUseCase: UpdateCartItemUseCase
    let placeOrderUseCase: PlaceOrderUseCase
    let pharamcyId: Int
    init(cartUseCase: GetCartByPharmacyIdUseCase, userDefaultUseCase: CachePharmacyUseCase, deleteCartUseCase: DeleteItemUseCase, updateCartItemUseCase: UpdateCartItemUseCase, placeOrderUseCase: PlaceOrderUseCase) {
        self.cartUseCase = cartUseCase
        self.userDefaultUseCase = userDefaultUseCase
        self.deleteCartUseCase = deleteCartUseCase
        self.updateCartItemUseCase = updateCartItemUseCase
        self.placeOrderUseCase = placeOrderUseCase
        self.pharamcyId = userDefaultUseCase.getCachedUser()?.id ?? 0
        fetchCartByPharmacyId()
    }

    func fetchCartByPharmacyId() {
        isLoading = true
        cartUseCase.excute(pharmacyId: pharamcyId) .sink { [weak self] completion in
            self?.isLoading = false
            if case let .failure(error) = completion {
                self?.errorMessage = error.localizedDescription
            }
        } receiveValue: { [weak self] cartResponse in
            self?.cartResponse = cartResponse
            
            self?.cartWarehousesList = cartResponse.data?.warehouses ?? []
            
        }.store(in: &cancellables)
    }
    
    func deleteItem(warehouseId: Int, itemId: Int) {
        isLoading = true
        deleteCartUseCase.excute(pharmacyId: pharamcyId, warehouseId: warehouseId, itemId: itemId)
            .sink { [weak self] completion in
            self?.isLoading = false
            if case let .failure(error) = completion {
                self?.errorMessage = error.localizedDescription
             
            }
        } receiveValue: { [weak self] response in
            if response.success {
                self?.successMessage = response.message
                self?.fetchCartByPharmacyId()
                
            }
            else {
                self?.errorMessage = response.message
                self?.isLoading = false
            }
        }.store(in: &cancellables)
    }
    
    func updateItem(warehouseId: Int, medicineId: Int, quantity: Int){
        updateCartItemUseCase.excute(pharmacyId: pharamcyId, warehouseId: warehouseId, medicineId: medicineId, quantity: quantity).sink { [weak self] completion in
            if case let .failure(error) = completion {
                self?.errorMessage = error.localizedDescription
            }
        } receiveValue: { [weak self] result in
            self?.fetchCartByPharmacyId()
        }.store(in: &cancellables)
    }
    
    func placeOrder(warehouseId: Int){
        placeOrderUseCase.placeOrder(pharmacyId: pharamcyId, warehouseId: warehouseId).sink { [weak self] completion in
            if case let .failure(error) = completion {
                self?.errorMessage = error.localizedDescription
            }
        } receiveValue: { [weak self] result in
            print(result.message)
            self?.fetchCartByPharmacyId()
        }.store(in: &cancellables)

    }
}

