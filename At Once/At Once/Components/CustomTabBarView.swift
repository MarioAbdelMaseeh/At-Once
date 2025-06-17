

//
//  CustomTabBarView.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//
import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedTab: Tab

    var body: some View {
        HStack(spacing: 40) {
            tabItem(icon: "house.fill", tab: .home)
            tabItem(icon: "basket.fill", tab: .cart)
            tabItem(icon: "person.fill", tab: .profile)
            tabItem(icon: "bell.fill", tab: .notifications)

        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(.customBackground))
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
        )
        .padding(.horizontal, 16)
    }

    @ViewBuilder
    func tabItem(icon: String, tab: Tab, color: Color = .primaryTeal, showBadge: Bool = false, badgeCount: Int = 0) -> some View {
        VStack(spacing: 4) {
            ZStack(alignment: .topTrailing) {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 24)
                    .foregroundColor(selectedTab == tab ? color : .gray)
            }

            Rectangle()
                .frame(height: 2)
                .foregroundColor(selectedTab == tab ? color : .clear)
                .cornerRadius(1)
        }
        .onTapGesture {
            selectedTab = tab
        }
    }
}
