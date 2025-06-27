//
//  TextFieldComponent.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//

import SwiftUI

struct TextFieldComponent: View {
    var title: String
    var textType: UITextContentType
    @Binding var text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8 ){
            Text(title)
                .fontWeight(.semibold)
            TextField(title, text: $text,)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .textContentType(textType)
        }
    }
}

#Preview {
    TextFieldComponent(title: "Email", textType: .emailAddress, text: .constant("Mario"))
}
