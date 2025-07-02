//
//  StoreViewModel.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 21/06/2025.
//
import Combine
import Foundation

protocol StoreScreenViewModelProtocol {
    func loadProducts(warehouseId: Int)
    func loadMoreIfNeeded(currentProduct: WarehouseProduct,warehouseId: Int)
    func reset(warehouseId: Int)
}

class StoreScreenViewModel: StoreScreenViewModelProtocol , ObservableObject{
    @Published var products: [WarehouseProduct] = []
    @Published var isLoading: Bool = false
    @Published var hasMorePages: Bool = true
    @Published var errorMessage: String?
    @Published var searchText: String = ""
    @Published var loadingProductIds: Set<Int> = []
    @Published var alert: StoreAlertType?
    @Published var selectedCategory: String = FilterOption.all[0].id
    
    private(set) var currentWarehouseId: Int = 0
    private var currentPage = 1
    private let pageSize = 10
    private var isFetching = false
    private var cancellables = Set<AnyCancellable>()
    let useCase: FetchProductByWarehouseIdUseCase
    let addToCartUseCase: AddToCartUseCase
    let userDefaultsUseCase: CachePharmacyUseCase
    
    init(useCase: FetchProductByWarehouseIdUseCase, addToCartUseCase: AddToCartUseCase, userDefaultsUseCase: CachePharmacyUseCase) {
        self.useCase = useCase
        self.addToCartUseCase = addToCartUseCase
        self.userDefaultsUseCase = userDefaultsUseCase
        $searchText
            .removeDuplicates()
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] newText in
                guard let self = self else { return }
                self.reset(warehouseId: self.currentWarehouseId)
            }
            .store(in: &cancellables)
        
    }

     func loadProducts(warehouseId: Int) {
         guard !isLoading, hasMorePages else { return }
         isLoading = currentPage == 1
         isFetching = true
         useCase.excute(warehouseId: warehouseId, page: currentPage, pageSize: pageSize, search: searchText  , type: selectedCategory)
            .sink { [weak self] completion in
                self?.isLoading = false
                self?.isFetching = false
                if case let .failure(error) = completion {
                    self?.alert = .error(message: error.localizedDescription)
                }
            } receiveValue: { [weak self] newProducts in
                guard let self = self else { return }
                if newProducts.count < self.pageSize {
                    self.hasMorePages = false
                } else {
                    self.currentPage += 1
                }
                self.products.append(contentsOf: newProducts)
            }
            .store(in: &cancellables)
    }

     func loadMoreIfNeeded(currentProduct: WarehouseProduct, warehouseId: Int) {
       guard let last = products.last, last.id == currentProduct.id else {return}
         if !isFetching {
             loadProducts(warehouseId: warehouseId)

         }
    }

     func reset(warehouseId: Int) {
        currentWarehouseId = warehouseId
        currentPage = 1
        hasMorePages = true
        products = []
        loadProducts(warehouseId: warehouseId)
    }
    func addToCart(p: WarehouseProduct, warehouseId: Int){
        let productId = p.medicineId
        loadingProductIds.insert(productId)
        let cartBody = CartBodyDTO(warehouseId: warehouseId , pharmacyId: userDefaultsUseCase.getCachedUser()?.id ?? 0, medicineId: p.medicineId, englishMedicineName: p.enName, arabicMedicineName: p.arName, medicineUrl: p.imageUrl, warehouseUrl: p.imageUrl, price: p.total, quantity: 1, discount: p.discount)
        addToCartUseCase.excute(cartBody: cartBody).sink {[weak self] completion in
            if case let .failure(error) = completion{
                self?.alert = .error(message: error.localizedDescription)
            }
        } receiveValue: { [weak self] result in
            self?.alert = .success(message: result.message)
            self?.loadingProductIds.remove(productId)
        }.store(in: &cancellables)
    }
}
