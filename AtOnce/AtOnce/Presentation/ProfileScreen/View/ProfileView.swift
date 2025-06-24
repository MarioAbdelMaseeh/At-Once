//
//  ProfileView.swift
//  At Once
//
//  Created by mac on 18/06/2025.
//

import SwiftUI

struct ProfileView: View {
    @State private var showSheet = false
    @State private var goToDetails = false
    @ObservedObject var viewModel: ProfileViewModel
    
    @EnvironmentObject var languageManager: LanguageManager
    
    let onLogout: () -> Void
    
    init(viewModel: ProfileViewModel, onLogout: @escaping () -> Void) {
        self.viewModel = viewModel
        self.onLogout = onLogout
    }
    
    var body: some View {
        
        VStack{
            Spacer().frame(height: 20)
            
            if let pharmacy = viewModel.pharmacy {
                ProfileHeader(profileName: pharmacy.name) {
                    goToDetails = true
                }
            }
            
            Spacer().frame(height: 80)
            VStack(alignment: .leading, spacing: 16) {
                NavigationLink {
                    WebViewScreen(
                        url: "https://atonce2025.blogspot.com/2025/06/frequently-asked-questions-body-font.html",
                        title: NSLocalizedString("common_questions", comment: "")
                    )
                } label: {
                    ProfileOption(icon: "questionmark.circle.fill", title: NSLocalizedString("common_questions", comment: ""))
                }
                
                Divider()
                
                NavigationLink {
                    WebViewScreen(
                        url: "https://atonce2025.blogspot.com/2025/06/frequently-asked-questions-body-font.html",
                        title: NSLocalizedString("privacy_policy", comment: "")
                    )
                } label: {
                    ProfileOption(icon: "shield.fill", title: NSLocalizedString("privacy_policy", comment: ""))
                }
                
                Divider()
                Button {
                    showSheet.toggle()
                } label: {
                    ProfileOption(icon: "headphones", title: NSLocalizedString("contact_us", comment: ""))
                }
                
                Divider()
                ProfileOption(icon: "exclamationmark.circle.fill", title: NSLocalizedString("about_us", comment: ""))
                Divider()
                ProfileOption(icon: "square.and.arrow.up.fill", title: NSLocalizedString("share_app", comment: ""))
                Divider()
                Button {
                    onLogout()
                } label: {
                    ProfileOption(icon: "rectangle.portrait.and.arrow.right.fill", title: NSLocalizedString("log_out", comment: ""), isDestructive: true)
                }
            }.padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color(.customBackground)))
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            Spacer()
            
            NavigationLink(
                destination: viewModel.pharmacy.map { pharmacy in
                    ProfileInfo(pharmacy: pharmacy)
                },
                isActive: $goToDetails
            ) {
                EmptyView()
            }
            .hidden()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(NSLocalizedString("profile", comment: ""))
                    .font(.title)
                    .fontWeight(.semibold)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // language toggle logic here
                } label: {
                    Image(systemName: "globe")
                        .tint(.primary)
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            BottomSheetView()
                .presentationDetents([.fraction(0.15)])
                .presentationDragIndicator(.visible)
        }
    }
}

//#Preview {
//    ProfileView()
//}
