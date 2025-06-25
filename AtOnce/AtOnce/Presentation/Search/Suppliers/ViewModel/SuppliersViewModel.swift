//
//  SuppliersViewModel.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 23/06/2025.
//
import Combine

protocol SuppliersScreenViewModelProtocol {
    func loadSuppliersProduct(areaId: Int, ProductId: Int)
}

class SuppliersScreenViewModel: SuppliersScreenViewModelProtocol, ObservableObject {
   
    
    @Published var suppliersProduct: [SuppliersProduct] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    let useCase: FetchSuppliersByProductIdUseCase
    let addToCart: AddToCartUseCase
    init(useCase: FetchSuppliersByProductIdUseCase, addToCart: AddToCartUseCase){
        self.useCase = useCase
        self.addToCart = addToCart
    }
    
    func loadSuppliersProduct(areaId: Int, ProductId: Int) {
        isLoading = true
        errorMessage = nil
        
        useCase.excute(areaId: areaId, productId: ProductId)
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
    
    
    
}

