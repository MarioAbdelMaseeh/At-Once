//
//  MainTabView.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//


import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            SearchScreen()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }

            StoreScreen()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }
         
                OrdersScreen()
        
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait")
                    Text("Orders")
                }
                
        }
    }
}

#Preview {
    MainTabView()
}
