//
//  MLNAsyncImage+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 16.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - EnvironmentValues+

extension EnvironmentValues {
    @available(iOS 17.0, *)
    private struct AsyncImageStyleKey: EnvironmentKey {
        static let defaultValue: MLNAsyncImage<EmptyView, EmptyView>.AsyncImageStyle = .init(transition: nil)
    }

    @available(iOS 17.0, *)
    var asyncImageStyle: MLNAsyncImage<EmptyView, EmptyView>.AsyncImageStyle {
        get { self[AsyncImageStyleKey.self] }
        set { self[AsyncImageStyleKey.self] = newValue }
    }
}



// MARK: - View+

extension View {

    // MARK: - Public methods

    ///
    ///
    ///
    @available(iOS 17.0, *)
    public func asyncImageStyle(_ style: MLNAsyncImage<EmptyView, EmptyView>.AsyncImageStyle = .init()) -> some View {
        environment(\.asyncImageStyle, style)
    }
}
