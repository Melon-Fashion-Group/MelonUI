//
//  ShineEffectViewModifier.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 29.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - ShineEffectViewModifier

@available(iOS 17.0, *)
struct ShineEffectViewModifier: ViewModifier {
    private let gradient: Gradient
    private let min, max: CGFloat
    private let animation: Animation

    @State private var isAnimated = true

    var startPoint: UnitPoint { isAnimated ? .init(x: min, y: min) : .init(x: 1, y: 1) }
    var endPoint: UnitPoint { isAnimated ? .init(x: 0, y: 0) : .init(x: max, y: max) }

    func body(content: Content) -> some View {
        content
            .mask { LinearGradient(gradient: gradient, startPoint: startPoint, endPoint: endPoint) }
            .onAppear { isAnimated = false }
            .animation(animation, value: isAnimated)
    }

    init(
        type: MLNShineEffectLuminosityType,
        width: CGFloat,
        animation: Animation
    ) {
        let gradient: Gradient = switch type {
        case .dark(opacity: let opacity):
                .init(colors: [.black.opacity(opacity), .black, .black.opacity(opacity)])
        case .light(opacity: let opacity):
                .init(colors: [.white, .white.opacity(opacity), .white])
        }

        self.gradient = gradient
        min = 0 - width
        max = 1 + width
        self.animation = animation
    }
}
