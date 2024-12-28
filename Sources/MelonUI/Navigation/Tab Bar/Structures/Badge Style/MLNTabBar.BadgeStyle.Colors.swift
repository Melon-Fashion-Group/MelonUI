//
//  MLNTabBar.BadgeStyle.Colors.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTabBar.BadgeStyle.Colors

extension MLNTabBar.BadgeStyle {

    ///
    ///
    ///
    public struct Colors: Sendable {
        let active: Color
        let inactive: Color
        let text: Color



        // MARK: - Init

        ///
        ///
        ///
        public init(
            active: Color = .black,
            inactive: Color = .gray,
            text: Color = .white
        ) {
            self.active = active
            self.inactive = inactive
            self.text = text
        }
    }
}
