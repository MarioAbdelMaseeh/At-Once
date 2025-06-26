//
//  NoInternetView.swift
//  AtOnce
//
//  Created by mac on 27/06/2025.
//


import SwiftUI

struct NoInternetView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "wifi.slash")
                .resizable()
                .frame(width: 100, height: 80)
                .foregroundColor(.red)

            Text("No Internet Connection")
                .font(.title)
                .fontWeight(.bold)

            Text("Please check your network and try again.")
                .foregroundColor(.secondary)
        }
        .multilineTextAlignment(.center)
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}
