//
//  StoreView.swift
//  At Once
//
//  Created by Iman Mahmoud on 16/06/2025.
//

import SwiftUI

struct StoreScreen: View {
    
    @State private var searchText: String = ""
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        
        VStack{
            
            SearchBarComponents(searchText: $searchText) .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 8)
            
            
            ScrollView {
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(0..<10, id: \.self) { _ in
                        StoreCard()
                    }
                }
                .padding()
            }
            
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        
       
                       
    }
}

#Preview {
    StoreScreen()
}
