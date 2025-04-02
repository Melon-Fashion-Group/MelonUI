//
//  MLNLinearBlur.TransparentView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 02.04.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNLinearBlur.TransparentView

extension MLNLinearBlur {

    // MARK: - Public structures

    struct TransparentView: UIViewRepresentable {

        // MARK: - Private properties

        private let blurEffect = UIBlurEffect()
        private let visualEffectView = UIVisualEffectView()

        private let propertyAnimator = UIViewPropertyAnimator()



        // MARK: - Public methods

        func makeUIView(context: Context) -> some UIView {
            propertyAnimator.addAnimations { visualEffectView.effect = blurEffect }
            propertyAnimator.fractionComplete = .zero
            propertyAnimator.stopAnimation(false)
            propertyAnimator.finishAnimation(at: .current)

            return visualEffectView
        }

        func updateUIView(_ uiView: UIViewType, context: Context) { }
    }
}
