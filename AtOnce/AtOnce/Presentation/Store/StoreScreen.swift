//
//  StoreView.swift
//  At Once
//
//  Created by Iman Mahmoud on 16/06/2025.
//

import SwiftUI

struct StoreScreen: View {

    @State private var searchText: String = ""
    @State private var selectedFilter = "None"
    @StateObject private var viewModel = StoreViewModel(
        useCase: FetchProductByWarehouseIdUseCaseImpl(
            warehouseRepository: WarehouseRepositoryImpl(
                networkService: NetworkService()
            )
        )
    )

    let filterOptions = ["Option 1", "Option 2"]

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {

        NavigationStack {

            VStack {

                HStack {
                    SearchBarComponents(searchText: $searchText)
                    FilterMenuComponent(
                        options: filterOptions,
                        selectedOption: $selectedFilter
                    )

                }
                .padding()

                ScrollView {

                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.products) { product in
                            StoreCard(product: product)
                                .onAppear {
                                    viewModel.loadMoreIfNeeded(
                                        currentProduct: product,
                                        warehouseId: 2
                                    )
                                }
                        }

                        if viewModel.isLoading {
                            ProgressView()
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.horizontal)
                    .onAppear {
//                        if viewModel.products.isEmpty {
//                                viewModel.loadProducts(warehouseId: 2)
//                            }
                        viewModel.reset(warehouseId: 2)
                        
                        // viewModel.loadProducts(warehouseId: 2, page: 1, pageSize: 10)

                      
                        
                    }
                }

            }
            //.edgesIgnoringSafeArea(.all)
            //  .background(Color(.customBackground))

            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("products")
                        .font(.title)
                        .fontWeight(.semibold)
                }

            }
        }

    }
}

#Preview {
    StoreScreen()
}
