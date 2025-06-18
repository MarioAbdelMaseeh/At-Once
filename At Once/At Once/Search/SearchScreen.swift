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



//struct ContentView: View {
//    @State private var searchText = ""
//    @State private var selectedFilter = "None"
//
//    let medicines = [
//        Medicine(name: "UM Pharma UM Pharma UM Pharma", discount: 28, price: 21.76),
//        Medicine(name: "UM Pharma UM Pharma UM Pharma", discount: 28, price: 21.76),
//        Medicine(name: "UM Pharma UM Pharma UM Pharma", discount: 28, price: 21.76)
//    ]
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                // Search and Filter
//                HStack {
//                    TextField("Search for medecin", text: $searchText)
//                        .padding(10)
//                        .background(Color(.systemGray6))
//                        .cornerRadius(10)
//
//                    Menu {
//                        Button("Option 1", action: { selectedFilter = "Option 1" })
//                        Button("Option 2", action: { selectedFilter = "Option 2" })
//                    } label: {
//                        Image(systemName: "line.horizontal.3.decrease.circle")
//                            .font(.title2)
//                    }
//                }
//                .padding()
//
//                ScrollView {
//                    VStack(spacing: 15) {
//                        ForEach(medicines) { medicine in
//                            MedicineCardView(medicine: medicine)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//            }
//            .navigationTitle("Medicines")
//        }
//    }
//}
