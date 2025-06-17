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
                    HStack{
                        RoundedIconButton(iconName: "phone.fill") {
                            
                        }
                        Spacer()
                        Text("Home").font(.title)
                        Spacer()
                        RoundedIconButton(iconName: "person.fill", action: {
                            
                        }).padding(.trailing,8)
                    }
                    
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
                            StoreCell()
                        }
                    }
                }.padding()
            }
            Spacer().frame(height: 40)
        }
    }
}

#Preview {
    HomeScreen()
}
