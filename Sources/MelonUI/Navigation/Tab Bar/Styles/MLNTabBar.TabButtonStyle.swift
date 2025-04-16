//
//  MLNTabBar.TabButtonStyle.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section


// MARK: Import section

import SwiftUI



// MARK: - MLNTabBar.TabButtonStyle

extension MLNTabBar {
    struct TabButtonStyle: ButtonStyle {
        private let animation: Animation?

        func makeBody(configuration: Configuration) -> some View {
            if let animation {
                configuration.label
                    .scaleEffect(
                        configuration.isPressed
                        ? .init(width: 0.95, height: 0.95)
                        : .init(width: 1, height: 1)
                    )
                    .animation(animation, value: configuration.isPressed)
            } else {
                configuration.label
                    .animation(.none, value: configuration.isPressed)
            }
        }

        init(animation: Animation?) {
            self.animation = animation
        }
    }
}
