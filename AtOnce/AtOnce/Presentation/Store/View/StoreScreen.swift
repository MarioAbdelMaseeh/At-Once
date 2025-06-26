//
//  StoreView.swift
//  At Once
//
//  Created by Iman Mahmoud on 16/06/2025.
//

import SwiftUI

struct StoreScreen: View {
    
    // @State private var searchText: String = ""
    @State private var selectedFilter = FilterOption.all[0]
    @ObservedObject var viewModel: StoreScreenViewModel
    
    @EnvironmentObject var languageManager: LanguageManager
    
    @EnvironmentObject var coordinator: AppCoordinator
    
    let warehouseId : Int
    
    
    
    //    @StateObject private var viewModel = StoreScreenViewModel(
    //        useCase: FetchProductByWarehouseIdUseCaseImpl(
    //            warehouseRepository: WarehouseRepositoryImpl(
    //                networkService: NetworkService()
    //            )
    //        )
    //    )
    
    init(warehouseId : Int, viewModel: StoreScreenViewModel) {
        self.warehouseId = warehouseId
        self.viewModel = viewModel
        //        _viewModel = StateObject(wrappedValue: AppDIContainer.shared.container.resolve(StoreScreenViewModelProtocol.self)! as! StoreScreenViewModel)
    }
    
    let filterOptions = FilterOption.all
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        
        VStack {
            HStack {
                SearchBarComponents(searchText: $viewModel.searchText)
                FilterMenuComponent(
                    options: filterOptions,
                    selectedOption: $selectedFilter
                )
            }
            .padding()
            
            ScrollView {
                
                LazyVGrid(columns: columns, spacing: 16) {
                    if viewModel.isLoading || viewModel.products.isEmpty {
                        ForEach(0..<6, id: \.self) { _ in
                            ShimmerCard()
                        }
                    }else if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .padding()
                    }
                    else{
                        ForEach(viewModel.products) { product in
                            StoreCard(product: product){
                                viewModel.addToCart(p: product, warehouseId: warehouseId)
                            }
                            .onAppear {
                                viewModel.loadMoreIfNeeded(
                                    currentProduct: product,
                                    warehouseId: warehouseId
                                )
                            }
                        }
                    }
                    
                    //                        if viewModel.isLoading {
                    //                            ProgressView()
                    //                                .frame(maxWidth: .infinity)
                    //                        }
                }
                .padding(.horizontal)
                .onAppear {
                    //                        if viewModel.products.isEmpty {
                    //                                viewModel.loadProducts(warehouseId: 2)
                    //                            }
                    print("on apeeeeeeeear")
                    viewModel.reset(warehouseId: 2)
                    
                    // viewModel.loadProducts(warehouseId: 2, page: 1, pageSize: 10)
                }
            }
        }
        //.edgesIgnoringSafeArea(.all)
        //  .background(Color(.customBackground))
        
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        coordinator.path.removeLast()
                    }) {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text(NSLocalizedString("back", comment: ""))
                        }
                    }
                }
            
            ToolbarItem(placement: .principal) {
                Text("products".localized)
                    .font(.title)
                    .fontWeight(.semibold)
            }
            
            
        }
       // .navigationTitle(NSLocalizedString("products".localized, comment: ""))
    }
}

#Preview {
    //    StoreScreen(warehouseId: 2)
}
