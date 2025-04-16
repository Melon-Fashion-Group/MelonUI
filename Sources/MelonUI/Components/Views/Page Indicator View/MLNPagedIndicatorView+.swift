//
//  MLNPageIndicatorView+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 29.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - EnvironmentValues+

extension EnvironmentValues {
    @available(iOS 17.0, *)
    private struct PageIndicatorStyleKey: EnvironmentKey {
        static let defaultValue: MLNPagedIndicatorView.IndicatorStyle = .init()
    }

    @available(iOS 17.0, *)
    var pageIndicatorStyle: MLNPagedIndicatorView.IndicatorStyle {
        get { self[PageIndicatorStyleKey.self] }
        set { self[PageIndicatorStyleKey.self] = newValue }
    }
}



// MARK: - View+

extension View {

    // MARK: - Public methods

    ///
    ///
    ///
    @available(iOS 17.0, *)
    public func pageIndicatorStyle(_ style: MLNPagedIndicatorView.IndicatorStyle) -> some View {
        environment(\.pageIndicatorStyle, style)
    }
}
