//
//  StoreViewModel.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 21/06/2025.
//
import Combine

protocol StoreScreenViewModelProtocol {
    func loadProducts(warehouseId: Int)
    func loadMoreIfNeeded(currentProduct: ProductOrder,warehouseId: Int)
    func reset(warehouseId: Int)
}

class StoreScreenViewModel: StoreScreenViewModelProtocol , ObservableObject{
    @Published var products: [ProductOrder] = []
    @Published var isLoading: Bool = false
    @Published var hasMorePages: Bool = true

    private var currentPage = 1
    private let pageSize = 10

    private var cancellables = Set<AnyCancellable>()
    let useCase: FetchProductByWarehouseIdUseCase

    init(useCase: FetchProductByWarehouseIdUseCase) {
        self.useCase = useCase
    }

     func loadProducts(warehouseId: Int) {
        guard !isLoading, hasMorePages else { return }

        isLoading = true

        useCase.excute(warehouseId: warehouseId, page: currentPage, pageSize: pageSize)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    print("Error:", error.localizedDescription)
                }
            } receiveValue: { [weak self] newProducts in
                guard let self = self else { return }
                if newProducts.count < self.pageSize {
                    self.hasMorePages = false
                } else {
                    self.currentPage += 1
                }
                print("new liiiiiiiiiiiiiiiiiiiiiiiist")
                self.products.append(contentsOf: newProducts)
            }
            .store(in: &cancellables)
    }

     func loadMoreIfNeeded(currentProduct: ProductOrder, warehouseId: Int) {
       guard let last = products.last, last.id == currentProduct.id else {return}

        loadProducts(warehouseId: warehouseId)
    }

     func reset(warehouseId: Int) {
        currentPage = 1
        hasMorePages = true
        products = []
        loadProducts(warehouseId: warehouseId)
    }
}
