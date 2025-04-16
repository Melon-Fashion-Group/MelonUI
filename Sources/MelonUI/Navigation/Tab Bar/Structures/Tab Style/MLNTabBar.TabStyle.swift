//
//  MLNTabBar.TabStyle.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTabBar.TabStyle

extension MLNTabBar {

    ///
    ///
    ///
    public struct TabStyle: Sendable {
        let colors: Colors
        let font: Font
        let offset: Offset
        let animation: Animation?



        // MARK: - Init

        ///
        ///
        ///
        public init(
            colors: Colors = .init(),
            font: Font = .system(size: 10),
            offset: Offset = .init(),
            animation: Animation? = nil
        ) {
            self.colors = colors
            self.font = font
            self.offset = offset
            self.animation = animation
        }
    }
}
