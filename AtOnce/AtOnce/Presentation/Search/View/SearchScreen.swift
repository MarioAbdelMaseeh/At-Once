//
//  SearchScreen.swift
//  At Once
//
//  Created by Iman Mahmoud on 18/06/2025.
//

import SwiftUI

struct SearchScreen: View {
    @ObservedObject private var viewModel: SearchViewModel
    @State private var selectedFilter = FilterOption.all[0]
    @State private var currentAlert: SearchAlertType?
    let filterOptions = FilterOption.all
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
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
            } else if !viewModel.products.isEmpty {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.products, id: \.id) { product in
                            ProductCardView(product: product,
                            isLoading: viewModel.loadingProductIds.contains(product.medicineId)){
                                viewModel.addToCart(p: product)
                            }
                                .onAppear {
                                    viewModel.loadMoreIfNeeded(currentItem: product)
                                }
                        }
                        
//                        if viewModel.isLoading {
//                            ProgressView()
//                                .padding()
//                        }
                    }
                    .padding(.horizontal)
                }
            }else{
                Lottie(animationName: "Fly")
            }
            Spacer()
        }
        .alert(item: $currentAlert) { alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                dismissButton: .default(Text("OK".localized)) {
                    viewModel.alert = nil
                }
            )
        }
        .onChange(of: viewModel.alert) {
            currentAlert = viewModel.alert
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("search".localized)
                    .font(.title)
                    .fontWeight(.semibold)
            }
        }
        
        .onAppear {
            viewModel.fetchProducts(areaId: viewModel.cachedPharmacy?.areaId ?? 2, text: viewModel.searchText, type: selectedFilter.id)
        }
        .onChange(of: selectedFilter) {
            viewModel.selectedCategory = selectedFilter.id
            viewModel.reset()
            viewModel.fetchProducts(
                areaId: viewModel.cachedPharmacy?.areaId ?? 2,
                text: viewModel.searchText,
                type: selectedFilter.id
            )
        }
    }
}

//#Preview {
//    SearchScreen()
//}


