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
                        Button {
                            
                        } label: {
                            Image(systemName: "phone.fill").resizable()
                                .frame(width: 20,height: 20)
                                .tint(.black)
                                .background(Circle().frame(width: 50,height: 50).tint(Color(.systemGray6)))
                        }.padding(.leading,8)
                        Spacer()
                        Text("Home").font(.title)
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "person.fill").resizable()
                                .frame(width: 20,height: 20)
                                .tint(.black)
                                .background(Circle().frame(width: 50,height: 50).tint(Color(.systemGray6)))
                        }.padding(.trailing,8)
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
                        .background(Color.lightGray)
                        .cornerRadius(12)
                    })
                    Spacer().frame(height: 4)
                    VStack(spacing: 16){
                        ForEach(items,id: \.self){
                            item in
                            StoreCell()
                        }
                    }
                    Spacer()
                }.padding()
            }
        }
    }
}

#Preview {
    HomeScreen()
}
