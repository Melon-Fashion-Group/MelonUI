//
//  MLNPageIndicatorView.IndicatorStyle.Colors.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 29.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNPageIndicatorView.IndicatorStyle.Colors

extension MLNPageIndicatorView.IndicatorStyle {

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
            active: Color = .white,
            inactive: Color = .gray
        ) {
            self.active = active
            self.inactive = inactive
        }
    }
}
