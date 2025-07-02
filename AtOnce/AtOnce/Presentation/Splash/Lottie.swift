//
//  LottieView.swift
//  AtOnceAdmin
//
//  Created by Adham Mohamed on 23/06/2025.
//

import Foundation
import SwiftUI
import Lottie

struct Lottie: UIViewRepresentable {
    let animationName: String
    let loopMode: LottieLoopMode = .playOnce

    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        let animationView = LottieAnimationView(name: animationName)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
