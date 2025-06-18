//
//  MainTabView.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//


import SwiftUI
enum Tab {
    case home, search, cart, orders
}
struct MainTabView: View {
    @State private var selectedTab: Tab = .home

        var body: some View {
            ZStack(alignment: .bottom) {
                Group {
                    switch selectedTab {
                    case .home:
                        HomeScreen()
                    case .search:
                        RegisterView()
                    case .cart:
                        CartScreen()
                    case .orders:
                        RegisterView()
                    }
                }
                .ignoresSafeArea()

                CustomTabBarView(selectedTab: $selectedTab)
            }
        }
//    var body: some View {
//        TabView {
//            HomeScreen()
//                .tabItem {
//                    Image(systemName: "house.fill")
//                    Text("Home")
//                }
//
//            LoginView()
//                .tabItem {
//                    Image(systemName: "magnifyingglass")
//                    Text("Search")
//                }
//
//            RegisterView()
//                .tabItem {
//                    Image(systemName: "cart.fill")
//                    Text("Cart")
//                }
//            RegisterView()
//                .tabItem {
//                    Image(systemName: "list.bullet.rectangle.portrait")
//                    Text("Orders")
//                }
//        }
//    }
}

#Preview {
    MainTabView()
}
