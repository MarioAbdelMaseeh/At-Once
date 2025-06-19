//
//  ProfileView.swift
//  At Once
//
//  Created by mac on 18/06/2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer().frame(height: 20)
                ProfileHeader()
                Spacer().frame(height: 80)
                VStack(alignment: .leading, spacing: 16){
                    ProfileOption(icon: "questionmark.circle.fill", title: "Common Questions")
                    Divider()
                    ProfileOption(icon: "shield.fill", title: "Privacy & Policy")
                    Divider()
                    ProfileOption(icon: "headphones", title: "Contact Us")
                    Divider()
                    ProfileOption(icon: "exclamationmark.circle.fill", title: "About Us")
                    Divider()
                    ProfileOption(icon: "square.and.arrow.up.fill", title: "Share App")
                    Divider()
                    ProfileOption(icon: "rectangle.portrait.and.arrow.right.fill", title: "Log out", isDestructive: true)
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.customBackground))
                )
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                Spacer()
            }.padding()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal){
                        Text("Profile").font(.title).fontWeight(.semibold)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            
                        } label: {
                            Image(systemName: "globe")
                                .tint(.primary)
                        }
                    }
                }
        }
    }
}

#Preview {
    ProfileView()
}
