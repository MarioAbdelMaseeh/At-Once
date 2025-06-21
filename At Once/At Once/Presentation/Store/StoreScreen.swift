//
//  StoreView.swift
//  At Once
//
//  Created by Iman Mahmoud on 16/06/2025.
//

import SwiftUI

struct StoreScreen: View {
    
    @State private var searchText: String = ""
    @State private var selectedFilter = "None"
   
    let filterOptions = ["Option 1", "Option 2"]
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        
        
        NavigationStack{
            
            VStack{
                
                HStack{
                    SearchBarComponents(searchText: $searchText)
                    FilterMenuComponent(options:filterOptions, selectedOption: $selectedFilter)
                    
                }
                .padding()
                
                
                ScrollView {
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(0..<10, id: \.self) { _ in
                            StoreCard()
                        }
                    }
                    .padding(.horizontal)
                }
                
            }//.edgesIgnoringSafeArea(.all)
          //  .background(Color(.customBackground))
            
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("products")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
            }
        }
        
       
                       
    }
}

#Preview {
    StoreScreen()
}
