struct CustomTabBarView: View {
    @Binding var selectedTab: Tab

    var body: some View {
        HStack(spacing: 40) {
            tabItem(icon: "house.fill", tab: .home, color: .orange)
            tabItem(icon: "basket.fill", tab: .cart)
            tabItem(icon: "person.fill", tab: .profile)
            tabItem(icon: "bell.fill", tab: .notifications, showBadge: true, badgeCount: 4)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(.systemGray6))
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
        )
        .padding(.horizontal, 24)
    }

    @ViewBuilder
    func tabItem(icon: String, tab: Tab, color: Color = .gray, showBadge: Bool = false, badgeCount: Int = 0) -> some View {
        VStack(spacing: 4) {
            ZStack(alignment: .topTrailing) {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 24)
                    .foregroundColor(selectedTab == tab ? color : .gray)

                if showBadge && badgeCount > 0 {
                    Text("\(badgeCount)")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Circle().fill(Color.yellow))
                        .offset(x: 12, y: -10)
                }
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