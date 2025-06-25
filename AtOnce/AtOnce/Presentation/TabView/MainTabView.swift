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
    let onLogout: () -> Void
    @StateObject private var tabCoordinator = TabCoordinator()
    var onNavigateOutOfTabs: (OutOfTabDestination) -> Void
    
    var body: some View {
        VStack {
            Group {
                switch tabCoordinator.selectedTab{
                case .home:
                    AnyView(
                        HomeScreen(
                            viewModel: AppDIContainer.shared.container.resolve(HomeScreenViewModelProtocol.self) as! HomeScreenViewModel,
                        ){
                            onLogout()
                        } onSearch: {
                            tabCoordinator.selectedTab = .search
                        }
                    )
                case .search:
                    AnyView(
                        SearchScreen(
                            viewModel: AppDIContainer.shared.container.resolve(SearchViewModelProtocol.self) as! SearchViewModel
                        )
                    )
                case .cart:
                    AnyView(CartScreen(viewModel: AppDIContainer.shared.container.resolve(CartViewModelProtocol.self) as! CartViewModel))
                case .orders:
                    AnyView(OrdersScreen())
                }
            }

            CustomTabBarView(selectedTab: $tabCoordinator.selectedTab)
        }
    }
}
