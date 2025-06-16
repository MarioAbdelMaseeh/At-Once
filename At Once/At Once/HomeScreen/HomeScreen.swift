//
//  HomeScreen.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading){
                    HStack{
                        Button {
                            
                        } label: {
                            Image(systemName: "phone.fill").resizable()
                                .frame(width: 20,height: 20)
                                .tint(.black)
                                .background(Circle().frame(width: 40,height: 40).tint(Color(.systemGray6)))
                        }.padding(.leading,8)
                        Spacer()
                        Text("Home").font(.title)
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "person.fill").resizable()
                                .frame(width: 20,height: 20)
                                .tint(.black)
                                .background(Circle().frame(width: 40,height: 40).tint(Color(.systemGray6)))
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
                        .frame(height: 42)
                        .background(Color(.systemGray6))
                        .cornerRadius(6)
                    })
                    
                    Spacer()
                }.padding()
            }
        }
    }
}

#Preview {
    HomeScreen()
}
