//
//  ProfileOption.swift
//  At Once
//
//  Created by mac on 19/06/2025.
//

import SwiftUI

struct ProfileOption: View {
    var icon: String
    var title: String
    var isDestructive: Bool = false
    
    @Environment(\.layoutDirection) var layoutDirection

    var body: some View {
        HStack {
            Image(systemName: icon)
                .imageScale(.large)
                .foregroundColor(isDestructive ? .red : Color.primaryTeal)
            
            Spacer().frame(width: 16)
            
            Text(title)
                .font(.title3)
                .foregroundColor(.primary)
            
            Spacer()
            
            Image(systemName: layoutDirection == .rightToLeft ? "chevron.left" : "chevron.right")
                .frame(width: 12, height: 24)
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    Group {
        ProfileOption(icon: "person", title: "Person")
            .environment(\.layoutDirection, .leftToRight)
            .previewDisplayName("LTR")

        ProfileOption(icon: "person", title: "شخص")
            .environment(\.layoutDirection, .rightToLeft)
            .previewDisplayName("RTL")
    }
}
