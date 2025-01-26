//
//  MLNPagedIndicatorView.Indicator.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 29.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNPagedIndicatorView.Indicator

extension MLNPagedIndicatorView {

    ///
    ///
    ///
    public struct Indicator {
        let view: AnyView



        // MARK: - Init

        ///
        ///
        ///
        public init(@ViewBuilder view: () -> some View) {
            self.view = .init(view())
        }
    }
}
