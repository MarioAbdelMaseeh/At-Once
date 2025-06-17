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

            LoginView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }

            RegisterView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }
            RegisterView()
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
