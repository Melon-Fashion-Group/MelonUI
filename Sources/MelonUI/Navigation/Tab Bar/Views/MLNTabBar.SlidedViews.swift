//
//  MLNTabBar.SlidedViews.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTabBar.SlidedViews

extension MLNTabBar {
    struct SlidedViews: View {
        private let selectedIndex: Int
        private let views: [(_: CGFloat) -> AnyView]
        private let size: CGSize
        private let topInset: CGFloat
        private let animation: Animation?

        var body: some View {
            HStack(spacing: .zero) {
                ForEach(views.indices, id: \.self) { index in
                    views[index](topInset)
                        .frame(width: size.width, height: size.height)
                }
            }
            .frame(width: size.width * .init(views.count), height: size.height)
            .offset(x: size.width * -.init(selectedIndex))
            .animation(animation, value: selectedIndex)
        }

        init(
            selection: Int,
            views: [(_: CGFloat) -> AnyView],
            size: CGSize,
            topInset: CGFloat,
            animation: Animation?
        ) {
            selectedIndex = selection
            self.views = views
            self.size = size
            self.topInset = topInset
            self.animation = animation
        }
    }
}
