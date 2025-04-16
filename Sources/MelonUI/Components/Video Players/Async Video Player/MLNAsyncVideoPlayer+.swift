//
//  MLNAsyncVideoPlayer+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import AVKit
import MelonKit
import SwiftUI



// MARK: - EnvironmentValues+

extension EnvironmentValues {
    @available(iOS 17.0, *)
    private struct AsyncVideoPlayerStyleKey: EnvironmentKey {
        static let defaultValue: MLNAsyncVideoPlayer<EmptyView, EmptyView>.AsyncVideoPlayerStyle = .init(transition: nil)
    }

    @available(iOS 17.0, *)
    var asyncVideoPlayerStyle: MLNAsyncVideoPlayer<EmptyView, EmptyView>.AsyncVideoPlayerStyle {
        get { self[AsyncVideoPlayerStyleKey.self] }
        set { self[AsyncVideoPlayerStyleKey.self] = newValue }
    }
}



// MARK: - View+

extension View {

    // MARK: - Public methods

    ///
    ///
    ///
    @available(iOS 17.0, *)
    public func asyncVideoPlayerStyle(_ style: MLNAsyncVideoPlayer<EmptyView, EmptyView>.AsyncVideoPlayerStyle = .init()) -> some View {
        environment(\.asyncVideoPlayerStyle, style)
    }
}
