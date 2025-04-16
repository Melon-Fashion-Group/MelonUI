//
//  MLNTabBar.TabStyle.Colors.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTabBar.TabStyle.Colors

extension MLNTabBar.TabStyle {

    ///
    ///
    ///
    public struct Colors: Sendable {
        let active: Color
        let inactive: Color



        // MARK: - Init

        ///
        ///
        ///
        public init(
            active: Color = .black,
            inactive: Color = .gray
        ) {
            self.active = active
            self.inactive = inactive
        }
    }
}
