//
//  MLNTabBar.ScaledViews.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTabBar.ScaledViews

extension MLNTabBar {
    struct ScaledViews: View {
        private let selectedIndex: Int
        private let views: [AnyView]
        private let size: CGSize
        private let animation: Animation?
        
        var body: some View {
            ZStack {
                ForEach(views.indices, id: \.self) { index in
                    views[index]
                        .frame(width: size.width, height: size.height)
                        .zIndex(selectedIndex == index ? .init(views.count) : .zero)
                        .scaleEffect(selectedIndex == index ? .identity : .init(width: 0.99, height: 0.99))
                        .opacity(selectedIndex == index ? 1 : .zero)
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
