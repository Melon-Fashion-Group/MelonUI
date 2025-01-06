//
//  MLNPageIndicatorView.Size.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 29.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNPageIndicatorView.Size

extension MLNPageIndicatorView {

    ///
    ///
    ///
    public struct Size: Sendable {
        let width: CGFloat
        let height: CGFloat



        // MARK: - Init

        ///
        ///
        ///
        public init(
            width: CGFloat = 10,
            height: CGFloat = 10
        ) {
            self.width = width
            self.height = height
        }
    }
}
