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
    var body: some View {
        VStack{
            HStack{
                Image(.icon)
                    .resizable()
                    .frame(width: 100,height: 100)
                Spacer().frame(width: 32)
                VStack(alignment: .leading){
                    Text(storeName).font(.headline)
                    Text(storeAddress).font(.caption2)
                    Text("")
                }
                Spacer()
            }
        }.padding()
            .background()
            .shadow(radius: 10)
            
            
    }
}

#Preview {
    StoreCell()
}
