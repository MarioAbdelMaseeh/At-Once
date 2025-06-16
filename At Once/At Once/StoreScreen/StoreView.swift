//
//  StoreView.swift
//  At Once
//
//  Created by Iman Mahmoud on 16/06/2025.
//

import SwiftUI

struct StoreView: View {
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        
        VStack{
            ScrollView {
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(0..<10, id: \.self) { _ in
                        ProductCard()
                    }
                }
                .padding()
            }
            
            VStack(spacing: 6) {
                            Text("Add 700 EGP to Complete the minimum")
                                .foregroundColor(.red)
                                .font(.footnote)

                            HStack {
                                Text("Total: 0.0 EGP")
                                Spacer()
                                Text("minimum: 700 EGP")
                            }
                            .font(.footnote)
                            .padding(.horizontal)
                        }
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        
       
                       
    }
}

#Preview {
    StoreView()
}
