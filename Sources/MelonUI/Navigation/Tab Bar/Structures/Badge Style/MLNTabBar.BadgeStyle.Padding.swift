//
//  MLNTabBar.BadgeStyle.Padding.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTabBar.BadgeStyle.Padding

extension MLNTabBar.BadgeStyle {

    ///
    ///
    ///
    public struct Padding: Sendable {
        let top: CGFloat
        let leading: CGFloat
        let trailing: CGFloat
        let bottom: CGFloat



        // MARK: - Init

        ///
        ///
        ///
        public init(
            top: CGFloat = .zero,
            leading: CGFloat = .zero,
            trailing: CGFloat = .zero,
            bottom: CGFloat = .zero
        ) {
            self.top = top
            self.leading = leading
            self.trailing = trailing
            self.bottom = bottom
        }

        ///
        ///
        ///
        public init(
            vertical: CGFloat = .zero,
            horizontal: CGFloat = .zero
        ) {
            self.init(
                top: vertical,
                leading: horizontal,
                trailing: horizontal,
                bottom: vertical
            )
        }
    }
}
