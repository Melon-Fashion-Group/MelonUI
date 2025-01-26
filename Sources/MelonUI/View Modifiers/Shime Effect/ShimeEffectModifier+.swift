//
//  ShimeEffectModifier+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 29.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - View+

extension View {

    // MARK: - Public methods

    ///
    ///
    ///
    @available(iOS 17.0, *)
    public func shimeEffect(
        gradient: Gradient = .init(colors: [.black.opacity(0.3), .black, .black.opacity(0.3)]),
        width: CGFloat = 1,
        animation: Animation = .linear(duration: 2).repeatForever(autoreverses: false)
    ) -> some View {
        modifier(ShimeEffectViewModifier(gradient: gradient, width: width, animation: animation))
    }
}
