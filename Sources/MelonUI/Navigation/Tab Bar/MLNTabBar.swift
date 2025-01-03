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

    @Binding private var selectedTab: Int

    @ObservedObject private var store: MLNTabStore

    @Environment(\.tabBarStyle) private var tabBarStyle
    @Environment(\.tabStyle) private var tabStyle
    @Environment(\.badgeStyle) private var badgeStyle



    // MARK: - Body

    public var body: some View {
        tabBarStyle.colors.background
            .ignoresSafeArea()
            .overlay {
                ContentView(
                    selection: selectedTab,
                    views: store.tabs.map { $0.view },
                    transition: tabBarStyle.transition,
                    animation: tabBarStyle.animation
                )
                .padding(.bottom, 50)
            }
            .overlay(alignment: .bottom) {
                TabView(
                    selection: $selectedTab,
                    tabs: store.tabs.map { ($0.icon, $0.title, $0.badge) },
                    tabStyle: tabStyle,
                    badgeStyle: badgeStyle
                )
                .frame(height: 50)
                .background(tabBarStyle.colors.foreground)
                .overlay(alignment: .top) {
                    separatorView
                }
            }
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        selection: Binding<Int>,
        store: MLNTabStore
    ) {
        _selectedTab = selection
        self.store = store
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
