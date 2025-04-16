//
//  MLNAsyncImage.AsyncImageStyle.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 16.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNAsyncImage.AsyncImageStyle

extension MLNAsyncImage {

    ///
    ///
    ///
    public struct AsyncImageStyle: Sendable {
        let transition: AnyTransition?
        let scaling: Scaling
        let aspect: Aspect

        ///
        ///
        ///
        public init(
            transition: AnyTransition? = .asymmetric(
                insertion: .scale(scale: 1.05),
                removal: .scale(scale: 0.95)
            ).combined(with: .opacity).animation(.smooth(duration: 0.3)),
            scaling: Scaling = .init(),
            aspect: Aspect = .init()
        ) {
            self.transition = transition
            self.scaling = scaling
            self.aspect = aspect
        }
    }
}

extension MLNAsyncImage.AsyncImageStyle {

    ///
    ///
    ///
    public struct Scaling: Sendable {
        let insets: EdgeInsets
        let resizingMode: Image.ResizingMode

        ///
        ///
        ///
        public init(
            insets: EdgeInsets = .init(),
            resizingMode: Image.ResizingMode = .stretch) {
            self.insets = insets
            self.resizingMode = resizingMode
        }
    }
}

extension MLNAsyncImage.AsyncImageStyle {

    ///
    ///
    ///
    public struct Aspect: Sendable {
        let ratio: CGFloat?
        let contentMode: ContentMode

        ///
        ///
        ///
        public init(
            ratio: CGFloat? = nil,
            contentMode: ContentMode = .fill
        ) {
            self.ratio = ratio
            self.contentMode = contentMode
        }
    }
}
