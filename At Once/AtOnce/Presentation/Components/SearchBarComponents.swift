//
//  SearchBarComponents.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//

import SwiftUI

struct SearchBarComponents: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("search_placeholder", text: $searchText)
                .frame(height: 40)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(8)
        }
        .padding(.horizontal)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    SearchBarComponents(searchText: .constant(""))
}
