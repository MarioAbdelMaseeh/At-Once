//
//  HomeScreen.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//

import SwiftUI

struct HomeScreen: View {
//    let items = Array(1...10)
    @StateObject var viewModel = HomeScreenViewModel(useCase: GetWarehouseByAreaUseCaseImpl(warehouseRepository: WarehouseRepositoryImpl(networkService: NetworkService())))
    
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
                        ForEach(viewModel.warehouses){
                            item in
                            NavigationLink {
                                StoreScreen()
                            } label: {
                                StoreCell(warehouse: item)
                            }
                        }
                    }.onAppear{
                        viewModel.fetchWarehouses(areaId: 2, page: 1, pageSize: 10)
                    }
                }.padding()
            }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink {
                            ProfileView()
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
                            ProfileView()
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

#Preview {
    HomeScreen()
}
