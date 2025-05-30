//
//  MLNTabBar.ContentView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTabBar.ContentView

extension MLNTabBar {
    struct ContentView: View {
        private let selectedTab: Int
        private let views: [(_: CGFloat) -> AnyView]
        private let topInset: CGFloat
        private let transition: Transition
        private let animation: Animation?

        var body: some View {
            GeometryReader { geometry in
                let size = geometry.size

                if let _ = animation {
                    multipleViews(size: size)
                } else {
                    singleView(size: size)
                }
            }
        }

        init(
            selection: Int,
            views: [(_: CGFloat) -> AnyView],
            topInset: CGFloat,
            transition: Transition,
            animation: Animation?
        ) {
            selectedTab = selection
            self.views = views
            self.topInset = topInset
            self.transition = transition
            self.animation = animation
        }
    }
}



// MARK: - UI

extension MLNTabBar.ContentView {
    @ViewBuilder
    private func multipleViews(size: CGSize) -> some View {
        switch transition {
        case .scale:
            MLNTabBar.ScaledViews(
                selection: selectedTab,
                views: views,
                size: size,
                topInset: topInset,
                animation: animation
            )
        case .slide:
            MLNTabBar.SlidedViews(
                selection: selectedTab,
                views: views,
                size: size,
                topInset: topInset,
                animation: animation
            )
        case .overlap:
            MLNTabBar.OverlappedViews(
                selection: selectedTab,
                views: views,
                size: size,
                topInset: topInset,
                animation: animation
            )
        case .overlay:
            MLNTabBar.OverlayedViews(
                selection: selectedTab,
                views: views,
                size: size,
                topInset: topInset,
                animation: animation
            )
        }
    }

    @ViewBuilder
    private func singleView(size: CGSize) -> some View {
        ZStack {
            ForEach(views.indices, id: \.self) { index in
                views[index](topInset)
                    .frame(width: size.width, height: size.height)
                    .zIndex(selectedTab == index ? .init(views.count) : .zero)
            }
        }
    }
}
