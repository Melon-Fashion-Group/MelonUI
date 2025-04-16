//
//  MLNTabBar.BadgeView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTabBar.BadgeView

extension MLNTabBar {
    struct BadgeView: View {
        private let title: String
        private let isSelected: Bool
        private let badgeStyle: BadgeStyle

        var body: some View {
            Text(title)
                .font(badgeStyle.font)
                .foregroundStyle(badgeStyle.colors.text)
                .offset(x: badgeStyle.offset.x, y: badgeStyle.offset.y)
                .background {
                    Capsule()
                        .fill(isSelected ? badgeStyle.colors.active : badgeStyle.colors.inactive)
                        .padding(.top, badgeStyle.padding.top)
                        .padding(.leading, badgeStyle.padding.leading)
                        .padding(.trailing, badgeStyle.padding.trailing)
                        .padding(.bottom, badgeStyle.padding.bottom)
                }
                .offset(x: 5, y: -4)
        }

        init(
            title: String,
            isSelected: Bool,
            style badgeStyle: BadgeStyle
        ) {
            self.title = title
            self.isSelected = isSelected
            self.badgeStyle = badgeStyle
        }
    }
}
