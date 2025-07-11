//
//  ProfileHeader.swift
//  At Once
//
//  Created by mac on 18/06/2025.
//

import SwiftUI

struct ProfileHeader: View {
    var profileName: String
    var onTap: () -> Void
    
    @Environment(\.layoutDirection) var layoutDirection
    
    var body: some View {
        HStack(spacing: 16) {
            Image(.profile)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                Text(profileName)
                    .fontWeight(.medium)
                    .font(.title3)
                Text(NSLocalizedString("see_account_details", comment: ""))
                    .font(.caption)
                    .foregroundStyle(Color.primaryTeal)
            }
            
            Spacer()
            
            Button {
             
                onTap()
            } label: {
                Image(systemName: layoutDirection == .rightToLeft ? "arrow.left" : "arrow.right")
                    .resizable()
                    .frame(width: 20, height: 15)
                    .tint(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 40, height: 40)
                            .tint(Color(.black))
                    )
            }
            
            Spacer().frame(width: 1)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.customBackground))
        )
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

//#Preview {
//    Group {
//        ProfileHeader()
//            .environment(\.layoutDirection, .leftToRight)
//            .previewDisplayName("LTR")
//
//        ProfileHeader()
//            .environment(\.layoutDirection, .rightToLeft)
//            .previewDisplayName("RTL")
//    }
//}
