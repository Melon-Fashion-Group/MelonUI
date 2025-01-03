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
    public func shimeEffect(_ style: MLNShimeEffectStyle) -> some View {
        modifier(ShimeEffectModifier(style: style))
    }
}
