//
//  DropDownComponent.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//

import SwiftUI

struct DropDownComponent: View {
    var title: String
    @Binding var selectedOption: String
    var options: [String]
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(title).fontWeight(.semibold)
            Menu {
                ForEach(options, id: \.self) { city in
                    Button(action: {
                        selectedOption = city
                    }) {
                        Text(city)
                    }
                }
            } label: {
                HStack {
                    Text(selectedOption)
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.black)
                }
                .padding()
                .frame(height: 60)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    DropDownComponent(title: "Governorate", selectedOption: .constant("alex"), options: ["alex","cairo","tanta"])
}
