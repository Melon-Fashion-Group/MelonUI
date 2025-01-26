//
//  ShimeEffectModifier.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 29.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - ShimeEffectModifier

@available(iOS 17.0, *)
struct ShimeEffectViewModifier: ViewModifier {
    private let gradient: Gradient
    private let animation: Animation

    private let min, max: CGFloat

    @State private var isAnimated = true

    var startPoint: UnitPoint { isAnimated ? .init(x: min, y: min) : .init(x: 1, y: 1) }
    var endPoint: UnitPoint { isAnimated ? .init(x: 0, y: 0) : .init(x: max, y: max) }

    func body(content: Content) -> some View {
        content
            .mask(LinearGradient(gradient: gradient, startPoint: startPoint, endPoint: endPoint))
            .onAppear { isAnimated = false }
            .animation(animation, value: isAnimated)
    }

    init(
        gradient: Gradient,
        width: CGFloat,
        animation: Animation
    ) {
        self.gradient = gradient
        self.animation = animation

        min = 0 - width
        max = 1 + width
    }
}
