//
//  HomeScreen.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//

import SwiftUI

struct HomeScreen: View {
    let items = Array(1...10)
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16){
                    HorizontalCollectionView()
                    NavigationLink(destination: RegisterView(), label: {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            Text("Search...")
                                .foregroundColor(.gray)
                                .padding(8)
                            Spacer()
                        }
                        .padding(.horizontal)
                        .frame(height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(6)
                    })
                  
                    VStack(spacing: 16){
                        ForEach(items,id: \.self){
                            item in
                            NavigationLink {
                                StoreView()
                            } label: {
                                StoreCell()
                            }
                        }
                    }
                }.padding()
            }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink {
                            ProfileView()
                        } label: {
                            Image(systemName: "phone.fill").resizable()
                                .frame(width: 20,height: 20)
                                .tint(.primary)
                        }
                    }
                    ToolbarItem(placement: .principal){
                            Text("Home").font(.title).fontWeight(.semibold)
                        }
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            ProfileView()
                        } label: {
                            Image(systemName: "person.fill").resizable()
                                .frame(width: 20,height: 20)
                                .tint(.primary)
                        }
                    }
                }
        }.tint(.primary)
    }
}

#Preview {
    HomeScreen()
}
