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
        VStack() {
            
            Group {
                switch selectedTab {
                case .home:
                    HomeScreen()
                case .search:
                    SearchScreen()
                case .cart:
                    CartScreen()
                case .orders:
                    OrdersScreen()
                }

                CustomTabBarView(selectedTab: $selectedTab)
            }
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
//            CartScreen()
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
