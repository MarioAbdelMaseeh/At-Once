//
//  SearchScreen.swift
//  At Once
//
//  Created by Iman Mahmoud on 18/06/2025.
//

import SwiftUI

struct SearchScreen: View {
    let items = Array(1...10)
    
    @State private var searchText = ""
    @State private var selectedFilter = "None"
   
    
    let filterOptions = ["Option 1", "Option 2"]
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    SearchBarComponents(searchText: $searchText)
                    FilterMenuComponent(options:filterOptions, selectedOption: $selectedFilter)
                    
                }
                .padding()
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(items, id: \.self) { medicine in
                            ProductCardView(isSuppliers: false)
                        }
                    }
                    .padding(.horizontal)
                }
                
                
                
                
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("Search")
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
        }
        
        
        
    }
}

#Preview {
    SearchScreen()
}



