//
//  MLNTabBar.TabBarStyle.Colors.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTabBar.TabBarStyle.Colors

extension MLNTabBar.TabBarStyle {

    ///
    ///
    ///
    public struct Colors: Sendable {
        let background: Color
        let foreground: Color
        let separator: Color



        // MARK: - Init

        ///
        ///
        ///
        public init(
            background: Color = .primary,
            foreground: Color = .primary,
            separator: Color = .clear
        ) {
            self.background = background
            self.foreground = foreground
            self.separator = separator
        }
    }
}
