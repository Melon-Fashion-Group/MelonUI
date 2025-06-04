//
//  MLNTabBar.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - MLNTabBar

///
///
///
@available(iOS 17.0, *)
public struct MLNTabBar: View {

    // MARK: - Private properties

    @ObservedObject private var store: MLNTabStore

    private let onTabTap: (() -> Void)?
    private let onSameTabDoubleTap: ((Int) -> Void)?

    private var selection: Binding<Int> {
        .init(
            get: { self.store.selectedTab },
            set: { newValue in
                onTabTap?()

                if newValue == self.store.selectedTab {
                    onSameTabDoubleTap?(newValue)
                }

                self.store.selectedTab = newValue
            }
        )
    }

    @Environment(\.tabBarStyle) private var tabBarStyle
    @Environment(\.tabStyle) private var tabStyle
    @Environment(\.badgeStyle) private var badgeStyle



    // MARK: - Body

    public var body: some View {
        tabBarStyle.colors.background
            .ignoresSafeArea()
            .overlay {
                GeometryReader { geometry in
                    let topInset = geometry.safeAreaInsets.top
                    let bottomInset = geometry.safeAreaInsets.bottom

                    VStack(spacing: .zero) {
                        ContentView(
                            selection: selection.wrappedValue,
                            views: store.tabs.map { $0.view },
                            topInset: topInset,
                            transition: tabBarStyle.transition,
                            animation: tabBarStyle.animation
                        )

                        TabView(
                            selection: selection,
                            tabs: store.tabs.map { ($0.icon, $0.title, $0.badge) },
                            bottomInset: bottomInset,
                            tabStyle: tabStyle,
                            badgeStyle: badgeStyle
                        )
                        .frame(height: 50 + bottomInset)
                        .background(tabBarStyle.colors.foreground)
                        .overlay(alignment: .top) { separatorView }
                    }
                    .ignoresSafeArea()
                }
            }
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        store: MLNTabStore,
        tap onTabTap: (() -> Void)? = nil,
        doubleTap onSameTabDoubleTap: ((Int) -> Void)? = nil
    ) {
        self.store = store
        self.onTabTap = onTabTap
        self.onSameTabDoubleTap = onSameTabDoubleTap
    }
}



// MARK: - UI

extension MLNTabBar {
    @ViewBuilder private var separatorView: some View {
        Rectangle()
            .fill(tabBarStyle.colors.separator)
            .frame(height: 1)
    }
}
