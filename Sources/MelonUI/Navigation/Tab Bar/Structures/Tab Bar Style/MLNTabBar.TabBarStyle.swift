//
//  MLNTabBar.TabBarStyle.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTabBar.TabBarStyle

extension MLNTabBar {

    ///
    ///
    ///
    public struct TabBarStyle: Sendable {
        let colors: Colors
        let transition: Transition
        let animation: Animation?



        // MARK: - Init

        ///
        ///
        ///
        public init(
            colors: Colors = .init(),
            transition: Transition = .slide,
            animation: Animation? = nil
        ) {
            self.colors = colors
            self.transition = transition
            self.animation = animation
        }
    }
}
