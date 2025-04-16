//
//  MLNTabBar+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - TabStyle

extension EnvironmentValues {
    @available(iOS 17.0, *)
    private struct TabBarStyleKey: EnvironmentKey {
        static let defaultValue: MLNTabBar.TabBarStyle = .init()
    }

    @available(iOS 17.0, *)
    private struct TabStyleKey: EnvironmentKey {
        static let defaultValue: MLNTabBar.TabStyle = .init()
    }

    @available(iOS 17.0, *)
    private struct BadgeStyleKey: EnvironmentKey {
        static let defaultValue: MLNTabBar.BadgeStyle = .init()
    }

    @available(iOS 17.0, *)
    var tabBarStyle: MLNTabBar.TabBarStyle {
        get { self[TabBarStyleKey.self] }
        set { self[TabBarStyleKey.self] = newValue }
    }

    @available(iOS 17.0, *)
    var tabStyle: MLNTabBar.TabStyle {
        get { self[TabStyleKey.self] }
        set { self[TabStyleKey.self] = newValue }
    }

    @available(iOS 17.0, *)
    var badgeStyle: MLNTabBar.BadgeStyle {
        get { self[BadgeStyleKey.self] }
        set { self[BadgeStyleKey.self] = newValue }
    }
}



// MARK: - View+

extension View {

    // MARK: - Public methods

    ///
    ///
    ///
    @available(iOS 17.0, *)
    public func tabBarStyle(_ style: MLNTabBar.TabBarStyle) -> some View {
        environment(\.tabBarStyle, style)
    }

    ///
    ///
    ///
    @available(iOS 17.0, *)
    public func tabStyle(_ style: MLNTabBar.TabStyle) -> some View {
        environment(\.tabStyle, style)
    }

    ///
    ///
    ///
    @available(iOS 17.0, *)
    public func badgeStyle(_ style: MLNTabBar.BadgeStyle) -> some View {
        environment(\.badgeStyle, style)
    }
}
