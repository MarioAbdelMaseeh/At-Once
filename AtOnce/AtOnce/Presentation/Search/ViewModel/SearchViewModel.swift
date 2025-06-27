//
//  SearchViewModel.swift
//  AtOnce
//
//  Created by mac on 22/06/2025.
//

import Combine
import Foundation
protocol SearchViewModelProtocol{
    func fetchProducts(areaId: Int, text: String, type: String)
    func loadMoreIfNeeded(currentItem: SearchProduct?)
}

class SearchViewModel : SearchViewModelProtocol,  ObservableObject{
    
    @Published var products: [SearchProduct] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var hasMorePages = true
    @Published var searchText: String = ""
    @Published var selectedCategory: String = FilterOption.all[0].id
    
    private var currentPage = 1
    private let pageSize = 10
    private var isFetching = false
    private var cancellables = Set<AnyCancellable>()
    let searchUseCase: SearchUseCase
    let addToCartUseCase: AddToCartUseCase
    let userDefaultsUseCase: CachePharmacyUseCase
    @Published var cachedPharmacy : CachedPharmacy?
    
    init(useCase: SearchUseCase, addToCartUseCase: AddToCartUseCase, userDefaultsUseCase: CachePharmacyUseCase){
        self.searchUseCase = useCase
        self.addToCartUseCase = addToCartUseCase
        self.userDefaultsUseCase = userDefaultsUseCase
       cachedPharmacy = userDefaultsUseCase.getCachedUser()
        
        $searchText
                .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
                .removeDuplicates()
                .sink { [weak self] text in
                    guard let self = self else { return }
                    self.reset()
                    self.fetchProducts(areaId: cachedPharmacy?.areaId ?? 2 , text: text,type: selectedCategory)
                }
                .store(in: &cancellables)
    }
    
    func fetchProducts(areaId: Int, text: String, type: String){
        guard !isFetching else{return}
        let page = currentPage
        isFetching = true
        isLoading = currentPage == 1
        searchUseCase.excute(area: areaId, text: text, page: page, pageSize: pageSize, type: type).sink { [weak self] completion in
            self?.isLoading = false
            self?.isFetching = false
            if case let .failure(error) = completion{
                self?.errorMessage = error.localizedDescription
                print(error.localizedDescription)
            }
        } receiveValue: {[weak self] newProducts in
            if(newProducts.isEmpty){
                self?.hasMorePages = false
            }else{
                if page == 1 {
                    self?.products = newProducts
                }else{
                    self?.products.append(contentsOf: newProducts)
                }
                self?.currentPage += 1
            }
        }
        .store(in: &cancellables)
    }
    func loadMoreIfNeeded(currentItem: SearchProduct?) {
        guard hasMorePages,
              let currentItem = currentItem,
              let index = products.firstIndex(where: { $0.id == currentItem.id })
        else { return }

        let threshold = products.count - 4
        if index >= threshold {
            fetchProducts(areaId: cachedPharmacy?.areaId ?? 2, text: searchText, type: selectedCategory)
        }
    }
    func reset() {
        currentPage = 1
        products = []
        hasMorePages = true
        errorMessage = nil
    }
    func addToCart(p: SearchProduct){
        let cartBody = CartBodyDTO(warehouseId: p.warehouseIdOfMaxDiscount , pharmacyId: userDefaultsUseCase.getCachedUser()?.id ?? 0, medicineId: p.medicineId, englishMedicineName: p.medicineName, arabicMedicineName: p.arabicMedicineName, medicineUrl: p.imageUrl, warehouseUrl: p.imageUrl, price: p.finalPrice, quantity: 1, discount: p.maximumDiscount)
        addToCartUseCase.excute(cartBody: cartBody).sink {[weak self] completion in
            if case let .failure(error) = completion{
                self?.errorMessage = error.localizedDescription
                print(error.localizedDescription)
            }
        } receiveValue: { result in
            print(result.message)
            print(result.success)
        }.store(in: &cancellables)
    }
}

struct FilterOption: Identifiable, Equatable {
    let id: String
    let label: String
    
    static let all: [FilterOption] = [
        FilterOption(id: "", label: "All".localized),
        FilterOption(id: "0", label: "Drugs".localized),
        FilterOption(id: "1", label: "Cosmetics".localized)
    ]
}
