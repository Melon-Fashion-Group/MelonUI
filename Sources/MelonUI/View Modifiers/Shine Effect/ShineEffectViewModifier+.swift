//
//  ShineEffectViewModifier+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 26.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
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
    public func shineEffect(
        type: MLNShineEffectLuminosityType = .dark(opacity: 0.3),
        width: CGFloat = 1,
        animation: Animation = .linear(duration: 2).repeatForever(autoreverses: false)
    ) -> some View {
        modifier(ShineEffectViewModifier(type: type, width: width, animation: animation))
    }
}
