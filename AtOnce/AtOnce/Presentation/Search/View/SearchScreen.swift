//
//  SearchScreen.swift
//  At Once
//
//  Created by Iman Mahmoud on 18/06/2025.
//

import SwiftUI

struct SearchScreen: View {
    @StateObject private var viewModel: SearchViewModel
    @State private var selectedFilter = "None"
    
    let filterOptions = ["Option 1", "Option 2"]
    init() {
        _viewModel = StateObject(wrappedValue: SearchViewModel(useCase: SearchUseCaseImpl(repo: SearchRepositoryImpl(network: NetworkService()))))
        
    }
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    SearchBarComponents(searchText: $viewModel.searchText)
                    FilterMenuComponent(options: filterOptions, selectedOption: $selectedFilter)
                }
                .padding()
                
                if viewModel.isLoading && viewModel.products.isEmpty {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(0..<5, id: \.self) { _ in
                                ProductCardLoadingView()
                            }
                        }
                        .padding(.horizontal)
                    }
                }else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(viewModel.products, id: \.id) { product in
                                ProductCardView(product: product)
                                    .onAppear {
                                        viewModel.loadMoreIfNeeded(currentItem: product)
                                    }
                            }

                            if viewModel.isLoading {
                                ProgressView()
                                    .padding()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Search")
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
            .onAppear {
                viewModel.fetchProducts(areaId: 2, text: viewModel.searchText, page: 1, pageSize: 10)
            }
        }
    }
}

#Preview {
    SearchScreen()
}



