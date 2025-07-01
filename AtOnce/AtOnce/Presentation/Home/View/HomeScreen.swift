//
//  HomeScreen.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var viewModel: HomeScreenViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    
    let onLogout: () -> Void
    let onSearch: () -> Void
    init(viewModel: HomeScreenViewModel, onLogout: @escaping () -> Void, onSearch: @escaping () -> Void) {
        self.viewModel = viewModel
        self.onLogout = onLogout
        self.onSearch = onSearch
    }
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 16){
                AdCarouselView()
                Button {
                    onSearch()
                } label: {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        Text("search".localized)
                            .foregroundColor(.gray)
                            .padding(8)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }
                VStack(spacing: 16) {
                    if viewModel.isLoading {
                        ForEach(0..<5, id: \.self) { _ in
                            LoadingCell()
                        }
                    } else if viewModel.warehouses.isEmpty {
                        Text("No warehouses available.")
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                    } else {
                        ForEach(viewModel.warehouses) { item in
                            Button {
                                coordinator.mainPath.append(.store(id: item.id))
                            } label: {
                                StoreCell(warehouse: item)
                                    .onAppear {
                                        viewModel.loadMoreIfNeeded(currentItem: item)
                                    }
                            }
                        }
                    }
                }
            }.padding()
        }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        if let url = URL(string: "tel://\(viewModel.getRepresentativePhone())"),
                           UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    } label: {
                        Image(systemName: "phone.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .tint(.primary)
                    }
                }
                ToolbarItem(placement: .principal){
                    Text("home".localized).font(.title).fontWeight(.semibold)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Button {
                        coordinator.mainPath.append(.profile)
                    } label: {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .tint(.primary)
                    }
                }
            }
    }
}

//#Preview {
//    HomeScreen()
//}
