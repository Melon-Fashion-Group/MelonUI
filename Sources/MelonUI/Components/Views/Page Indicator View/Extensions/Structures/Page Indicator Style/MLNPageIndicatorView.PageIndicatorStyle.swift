//
//  MLNPageIndicatorView.IndicatorStyle.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 29.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNPageIndicatorView.IndicatorStyle

extension MLNPageIndicatorView {

    ///
    ///
    ///
    public struct IndicatorStyle: Sendable {
        let colors: Colors
        let spacing: CGFloat
        let size: Size
        let displayedCount: Int
        let animation: Animation?



        // MARK: - Init

        ///
        ///
        ///
        public init(
            colors: Colors = .init(),
            spacing: CGFloat = .zero,
            size: Size = .init(),
            displayedCount: Int = 2,
            animation: Animation? = nil
        ) {
            self.colors = colors
            self.spacing = spacing
            self.size = size
            self.displayedCount = displayedCount
            self.animation = animation
        }
    }
}
