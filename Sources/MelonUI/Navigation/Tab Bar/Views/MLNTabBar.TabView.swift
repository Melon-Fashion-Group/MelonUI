//
//  MLNTabBar.TabView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTabBar.TabView

extension MLNTabBar {
    struct TabView: View {
        @Binding private var selectedTab: Int
        private let tabs: [(image: Image, title: LocalizedStringKey?, badge: String?)]
        private let tabStyle: TabStyle
        private let badgeStyle: BadgeStyle

        var body: some View {
            HStack(spacing: .zero) {
                ForEach(tabs.indices, id: \.self) { index in
                    Button {
                        selectedTab = index
                    } label: {
                        tabView(tab: tabs[index], index: index)
                            .foregroundStyle(selectedTab == index ? tabStyle.colors.active : tabStyle.colors.inactive)
                            .padding(.top, 6)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .buttonStyle(TabButtonStyle(animation: tabStyle.animation))
                }
            }
            .clipped()
        }

        init(
            selection: Binding<Int>,
            tabs: [(image: Image, title: LocalizedStringKey?, badge: String?)],
            tabStyle: TabStyle,
            badgeStyle: BadgeStyle
        ) {
            _selectedTab = selection
            self.tabs = tabs
            self.tabStyle = tabStyle
            self.badgeStyle = badgeStyle
        }
    }
}



// MARK: - UI

extension MLNTabBar.TabView {
    @ViewBuilder
    private func tabView(
        tab: (image: Image, title: LocalizedStringKey?, badge: String?),
        index: Int
    ) -> some View {
        let size: CGFloat = tab.title == nil ? 26 : 22

        VStack(spacing: 6) {
            imageView(tab.image)
                .frame(width: size, height: size)
                .overlay(alignment: .topTrailing) {
                    if let badge = tab.badge {
                        MLNTabBar.BadgeView(
                            title: badge,
                            isSelected: selectedTab == index,
                            style: badgeStyle
                        )
                        .transition(
                            .scale
                                .combined(with: .opacity)
                                .animation(badgeStyle.animation)
                        )
                    }
                }

            if let title = tab.title {
                Text(title)
                    .font(tabStyle.font)
                    .offset(x: tabStyle.offset.x, y: tabStyle.offset.y)
            }
        }
    }

    @ViewBuilder
    private func imageView(_ image: Image) -> some View {
        image
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}
