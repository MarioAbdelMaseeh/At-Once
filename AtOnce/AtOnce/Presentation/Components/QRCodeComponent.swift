//
//  QRCodeComponent.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//

import SwiftUI

import SwiftUI

struct QRCodeComponent: View {
    var title: String
    @Binding var qrCode: String
    var onScanTapped: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .fontWeight(.semibold)
            
            HStack {
                
                SecureField(title, text: $qrCode)
                    .disabled(true)
                    .textContentType(.password)
                    .foregroundColor(qrCode.isEmpty ? .gray : .primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: {
                    onScanTapped()
                }) {
                    Image(systemName: "qrcode.viewfinder")
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
    QRCodeComponent(title: "Invitation Code", qrCode: .constant(""), onScanTapped: {})
}
