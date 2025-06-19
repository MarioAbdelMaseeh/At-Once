//
//  QRCodeComponent.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//

import SwiftUI

struct QRCodeComponent: View {
    var title: String
    @Binding var qrCode: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .fontWeight(.semibold)
            
            HStack {
                TextField("Invitation Code", text: $qrCode)
                
                Button(action: {
                    
                }) {
                    Image(systemName: "qrcode")
                        .foregroundColor(.black)
                }
            }
            .padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
        }
    }
}

#Preview {
    QRCodeComponent(title: "Invitation Code", qrCode: .constant(""))
}
