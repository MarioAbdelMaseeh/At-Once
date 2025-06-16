//
//  HorizontalCollectionView.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//


import SwiftUI

struct HorizontalCollectionView: View {
    let items = Array(1...10)

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(items, id: \.self) { item in
                    Button {
                        
                    } label: {
                        Image(.icon).resizable()
                            .frame(width: 350, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    
                }
            }
            .padding()
        }
    }
}
