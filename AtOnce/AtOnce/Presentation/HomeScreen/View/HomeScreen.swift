//
//  HomeScreen.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var viewModel: HomeScreenViewModel
    let onLogout: () -> Void
    init(viewModel: HomeScreenViewModel, onLogout: @escaping () -> Void) {
        self.viewModel = viewModel
        self.onLogout = onLogout
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16){
                    AdCarouselView()
                    NavigationLink(destination: RegisterView(), label: {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            Text("search_placeholder")
                                .foregroundColor(.gray)
                                .padding(8)
                            Spacer()
                        }
                        .padding(.horizontal)
                        .frame(height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    })
                    
                    VStack(spacing: 16){
                        if(viewModel.isLoading){
                            ForEach(0..<5, id: \.self) { _ in
                                LoadingCell()
                            }
                        }
                        ForEach(viewModel.warehouses){
                            item in
                            NavigationLink {
                                StoreScreen(warehouseId: item.id)
                            } label: {
                                StoreCell(warehouse: item)
                                    .onAppear{
                                        viewModel.loadMoreIfNeeded(currentItem: item)
                                    }
                            }
                        }
                    }
                }.padding()
            }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink {
//                            ProfileView()
                        } label: {
                            Image(systemName: "phone.fill").resizable()
                                .frame(width: 20,height: 20)
                                .tint(.primary)
                        }
                    }
                    ToolbarItem(placement: .principal){
                        Text("home").font(.title).fontWeight(.semibold)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            ProfileView(viewModel: AppDIContainer.shared.container.resolve(ProfileViewModelProtocol.self) as! ProfileViewModel) {
                                onLogout()
                            }
                        } label: {
                            Image(systemName: "person.fill").resizable()
                                .frame(width: 20,height: 20)
                                .tint(.primary)
                        }
                    }
                }
        }.tint(.primary)
    }
}

//#Preview {
//    HomeScreen()
//}
