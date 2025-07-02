//
//  NoInternetView.swift
//  AtOnce
//
//  Created by mac on 27/06/2025.
//


import SwiftUI

struct NoInternetView: View {
    var body: some View {
        VStack {
            Text("no_internet_title".localized)
                .font(.title)
                .fontWeight(.bold)

            Text("no_internet_message".localized)
                .foregroundColor(.secondary)

            Lottie(animationName: "No-Internet")
        }
        .multilineTextAlignment(.center)
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}
