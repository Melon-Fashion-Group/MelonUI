//
//  MLNTabBar.OverlayedViews.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTabBar.OverlayedViews

extension MLNTabBar {
    struct OverlayedViews: View {
        private let selectedIndex: Int
        private let views: [(_: CGFloat) -> AnyView]
        private let size: CGSize
        private let topInset: CGFloat
        private let animation: Animation?

        var body: some View {
            ZStack {
                ForEach(views.indices, id: \.self) { index in
                    let offset = computeOffset(by: index, with: size.width)

                    views[index](topInset)
                        .frame(width: size.width, height: size.height)
                        .offset(x: offset)
                        .blur(radius: index < selectedIndex ? 10 : .zero)
                        .animation(animation, value: selectedIndex)
                }
            }
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

        private func computeOffset(by index: Int, with width: CGFloat) -> CGFloat {
            switch index {
            case .zero ..< selectedIndex: -width / 3
            case selectedIndex: .zero
            case (selectedIndex + 1) ..< views.count: width
            default: .zero
            }
        }
    }
}
