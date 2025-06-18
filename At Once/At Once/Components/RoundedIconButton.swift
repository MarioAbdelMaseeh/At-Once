//
//  RoundedIconButton.swift
//  At Once
//
//  Created by mac on 17/06/2025.
//

import SwiftUI

struct RoundedIconButton: View {

    var iconName: String
    var action: ()->Void
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: iconName).resizable()
                .frame(width: 20,height: 20)
                .tint(.primary)
                .background(Circle().frame(width: 40,height: 40).tint(Color(.systemGray5)))
        }.padding(.leading,8)

    }
}

#Preview {
    RoundedIconButton(iconName: "phone.fill"){
        
    }

}
