//
//  HorizontalCollectionView.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//


import SwiftUI
//
//struct HorizontalCollectionView: View {
//    let items = Array(1...10)
//
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 16) {
//                ForEach(items, id: \.self) { item in
//                    Button {
//                        
//                    } label: {
//                        Image(.icon).resizable()
//                            .frame(width: 350, height: 150)
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                    }
//                }
//            }
//        }
//    }
//}
import SwiftUI

struct AdCarouselView: View {
    let images = Array(1...5).map { "ad_\($0)" } // Replace with your image names

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
                        .frame(width: .infinity,height: 180)
                        .clipped()
                        .cornerRadius(12)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never)) // hide default dots
            .frame(height: 180)
            .onReceive(timer) { _ in
                withAnimation {
                    currentIndex = (currentIndex + 1) % images.count
                }
            }

            // Custom page indicator (dots)
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
