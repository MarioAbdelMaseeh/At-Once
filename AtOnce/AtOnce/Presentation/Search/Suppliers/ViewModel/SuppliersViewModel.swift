//
//  SuppliersViewModel.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 23/06/2025.
//
import Combine

protocol SuppliersScreenViewModelProtocol {
    func loadSuppliersProduct(productId: Int)
}

class SuppliersScreenViewModel: SuppliersScreenViewModelProtocol, ObservableObject {
   
    
    @Published var suppliersProduct: [SuppliersProduct] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var successMessage: String?
    @Published var loadingProductIds: Set<Int> = []
    
    private var cancellables = Set<AnyCancellable>()
    
    let useCase: FetchSuppliersByProductIdUseCase
    let addToCartUseCase: AddToCartUseCase
    let userDefaultsUseCase: CachePharmacyUseCase
    init(useCase: FetchSuppliersByProductIdUseCase, addToCartUseCase: AddToCartUseCase, userDefaultsUseCase: CachePharmacyUseCase){
        self.useCase = useCase
        self.addToCartUseCase = addToCartUseCase
        self.userDefaultsUseCase = userDefaultsUseCase
    }
    
    func loadSuppliersProduct(productId: Int) {
        isLoading = true
        errorMessage = nil
        
        useCase.excute(areaId: userDefaultsUseCase.getCachedUser()?.areaId ?? 0, productId: productId)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] value in
                self?.suppliersProduct = value
            }
            .store(in: &cancellables)
        
    }
    func addToCart(p: SuppliersProduct){
        let productId = p.medicineId
            loadingProductIds.insert(productId)
        let cartBody = CartBodyDTO(warehouseId: p.warehouseId, pharmacyId: userDefaultsUseCase.getCachedUser()?.id ?? 0, medicineId: p.medicineId, englishMedicineName: p.medicineName, arabicMedicineName:p.medicineName, medicineUrl: p.warehouseImageUrl, warehouseUrl: p.warehouseImageUrl, price: p.finalPrice, quantity: 1, discount: p.discount)
        addToCartUseCase.excute(cartBody: cartBody).sink {[weak self] completion in
            if case let .failure(error) = completion{
                self?.errorMessage = error.localizedDescription
                print(error.localizedDescription)
            }
        } receiveValue: { [weak self] result in
            self?.successMessage = result.message
            self?.loadingProductIds.remove(productId)
        }.store(in: &cancellables)
    }
}

