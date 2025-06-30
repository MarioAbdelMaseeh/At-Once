//
//  HomeScreenViewModel.swift
//  At Once
//
//  Created by mac on 21/06/2025.
//

import Combine
protocol HomeScreenViewModelProtocol{
    func fetchWarehouses(areaId: Int, page: Int, pageSize: Int)
    func loadMoreIfNeeded(currentItem: Warehouse?)
}

class HomeScreenViewModel : HomeScreenViewModelProtocol,  ObservableObject{
    
    @Published var warehouses: [Warehouse] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var hasMorePages = true
    
    private var currentPage = 1
    private let pageSize = 10
    private var isFetching = false
    private var cancellables = Set<AnyCancellable>()
    let useCase: GetWarehouseByAreaUseCase
    let userDefaultUseCase: CachePharmacyUseCase
    
    init(useCase: GetWarehouseByAreaUseCase,userDefaultUseCase: CachePharmacyUseCase){
        self.useCase = useCase
        self.userDefaultUseCase = userDefaultUseCase
        fetchWarehouses(areaId: userDefaultUseCase.getCachedUser()?.areaId ?? 2, page: currentPage, pageSize: pageSize)
    }
    
    func fetchWarehouses(areaId: Int, page: Int , pageSize: Int ){
        guard !isFetching else{return}
        isFetching = true
        isLoading = page == 1
        
        useCase.excute(areaId: areaId, page: page, pageSize: pageSize).sink { [weak self] completion in
            self?.isLoading = false
            self?.isFetching = false
            if case let .failure(error) = completion{
                self?.errorMessage = error.localizedDescription
                print(error.localizedDescription)
            }
        } receiveValue: {[weak self] newWarehouses in
            if(newWarehouses.isEmpty){
                self?.hasMorePages = false
            }else{
                if page == 1 {
                    self?.warehouses = newWarehouses
                }else{
                    self?.warehouses.append(contentsOf: newWarehouses)
                }
                self?.currentPage += 1
            }
        }
        .store(in: &cancellables)
    }
    func loadMoreIfNeeded(currentItem: Warehouse?) {
        guard hasMorePages,
                      let currentItem = currentItem,
                      let index = warehouses.firstIndex(where: { $0.id == currentItem.id })
                else { return }

                let threshold = warehouses.count - 4
                if index >= threshold {
                    fetchWarehouses(areaId: 2, page: currentPage, pageSize: pageSize)
                }
    }
    
    func getRepresentativePhone()-> String{
        self.userDefaultUseCase.getCachedUser()?.representativePhone ?? ""
    }
}
