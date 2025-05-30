//
//  MLNTabBar.OverlappedViews.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTabBar.OverlappedViews

extension MLNTabBar {
    struct OverlappedViews: View {
        private let selectedIndex: Int
        private let views: [AnyView]
        private let size: CGSize
        private let animation: Animation?

        var body: some View {
            ZStack {
                ForEach(views.indices, id: \.self) { index in
                    let isFarView = index < selectedIndex
                    let isNearView = index > selectedIndex

                    views[index]
                        .frame(width: size.width, height: size.height)
                        .scaleEffect(isNearView ? .init(width: 1.05, height: 1.05) : .identity)
                        .opacity(isNearView ? .zero : 1)
                        .blur(radius: isFarView ? 10 : .zero)
                        .animation(animation, value: selectedIndex)
                }
            }
        }

        init(
            selection: Int,
            views: [AnyView],
            size: CGSize,
            animation: Animation?
        ) {
            selectedIndex = selection
            self.views = views
            self.size = size
            self.animation = animation
        }
    }
}
