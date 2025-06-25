//
//  SearchViewModel.swift
//  AtOnce
//
//  Created by mac on 22/06/2025.
//

import Combine
import Foundation
protocol SearchViewModelProtocol{
    func fetchProducts(areaId: Int, text: String, page: Int, pageSize: Int)
    func loadMoreIfNeeded(currentItem: SearchProduct?)
}

class SearchViewModel : SearchViewModelProtocol,  ObservableObject{
    
    @Published var products: [SearchProduct] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var hasMorePages = true
    @Published var searchText: String = ""

    private var currentPage = 1
    private let pageSize = 10
    private var isFetching = false
    private var cancellables = Set<AnyCancellable>()
    let useCase: SearchUseCase
    
    init(useCase: SearchUseCase){
        self.useCase = useCase
        $searchText
                .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
                .removeDuplicates()
                .sink { [weak self] text in
                    guard let self = self else { return }
                    self.reset()
                    self.fetchProducts(areaId: 2, text: text, page: 1, pageSize: self.pageSize)
                }
                .store(in: &cancellables)
    }
    
    func fetchProducts(areaId: Int, text: String, page: Int , pageSize: Int ){
        guard !isFetching else{return}
        isFetching = true
        isLoading = page == 1
        
        useCase.excute(area: areaId, text: text, page: page, pageSize: pageSize).sink { [weak self] completion in
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
            fetchProducts(areaId: 2, text: searchText, page: currentPage, pageSize: pageSize)
        }
    }
    func reset() {
        currentPage = 1
        products = []
        hasMorePages = true
        errorMessage = nil
    }
}
