//
//  StoreCell.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//

import SwiftUI

struct StoreCell: View {
    var storeName: String = "My store"
    var storeAddress: String = "Store Address"
    var mini: Int = 700
    var body: some View {
        VStack{
            HStack{
                Image(.icon)
                    .resizable()
                    .frame(width: 100,height: 100)
                Spacer().frame(width: 32)
                VStack(alignment: .leading){
                    Text(storeName).font(.title)
                    Text(storeAddress).font(.caption2)
                    Text("Minimum : \(mini) EGP").font(.subheadline)
                    Text("Delivery Daily").font(.subheadline)
                }
                Spacer()
            }
        }.padding()
            .background(in: RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 1)
            
            
    }
}

#Preview {
    StoreCell()
}
