//
//  HomeScreenViewModel.swift
//  At Once
//
//  Created by mac on 21/06/2025.
//

import Combine
protocol HomeScreenViewModelProtocol: ObservableObject{
    
}

class HomeScreenViewModel : HomeScreenViewModelProtocol{
    @Published var warehouses: [Warehouse] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()
    let useCase: GetWarehouseByAreaUseCase
    init(useCase: GetWarehouseByAreaUseCase){
        self.useCase = useCase
        fetchWarehouses(areaId: 2, page: 1, pageSize: 10)
    }
    
    func fetchWarehouses(areaId: Int, page: Int, pageSize: Int){
        isLoading = true
        useCase.excute(areaId: areaId, page: page, pageSize: pageSize).sink { [weak self] completion in
            self?.isLoading = false
            if case let .failure(error) = completion{
                self?.errorMessage = error.localizedDescription
            }
        } receiveValue: {[weak self] warehouses in
            print("Received warehouses: \(warehouses.count)")
            self?.warehouses = warehouses
        }
        .store(in: &cancellables)

    }
}
