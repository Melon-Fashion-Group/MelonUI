//
//  MLNShimeEffectStyle.Colors.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 29.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNShimeEffectStyle.Colors

extension MLNShimeEffectStyle {

    ///
    ///
    ///
    public struct Colors {

        let tint: Color
        let highlight: Color



        // MARK: - Init

        ///
        ///
        ///
        public init(
            tint: Color = .black,
            highlight: Color = .white
        ) {
            self.tint = tint
            self.highlight = highlight
        }
    }
}
