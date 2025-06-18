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
                        .background(Color.lightGray)
                        .cornerRadius(12)
                    })
                  
                    VStack(spacing: 16){
                        ForEach(items,id: \.self){
                            item in
                            NavigationLink {
                                StoreScreen()
                            } label: {
                                StoreCell()
                            }
                        }
                    }
                }.padding()
            }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal){
                        HStack{
                            RoundedIconButton(iconName: "phone.fill") {
                                
                            }
                            Spacer()
                            Text("Home").font(.title).fontWeight(.semibold)
                            Spacer()
                            RoundedIconButton(iconName: "person.fill", action: {
                                
                            }).padding(.trailing,8)
                        }
                    }
                }
            
        }
    }
}

#Preview {
    HomeScreen()
}
