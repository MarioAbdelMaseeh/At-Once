//
//  HorizontalCollectionView.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//


import SwiftUI

import SwiftUI

struct AdCarouselView: View {
    let images = Array(1...5).map { "ad_\($0)" } 

    @State private var currentIndex = 0
    let timer = Timer.publish(every: 6, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(images.indices, id: \.self) { index in
//                    Image(images[index])
                    Image(.icon)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, minHeight: 180, maxHeight: 180)
                        .clipped()
                        .cornerRadius(12)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never)) 
            .frame(height: 180)
            .onReceive(timer) { _ in
                withAnimation {
                    currentIndex = (currentIndex + 1) % images.count
                }
            }

            HStack(spacing: 8) {
                ForEach(images.indices, id: \.self) { index in
                    Circle()
                        .fill(index == currentIndex ? Color.primaryTeal : .gray.opacity(0.5))
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.top, 8)
        }
    }
}

#Preview {
    AdCarouselView()
}
