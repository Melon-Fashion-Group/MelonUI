//
//  MLNBackgroundView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 18.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNBackgroundView

///
///
///
@available(iOS 17.0, *)
public struct MLNBackgroundView<Content: View>: View {

    // MARK: - Private properties

    private let backgroundColor: Color
    private let alignment: Alignment
    private let content: Content



    // MARK: - Body

    public var body: some View {
        backgroundColor
            .ignoresSafeArea()
            .overlay(alignment: alignment) { content }
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        color backgroundColor: Color,
        alignment: Alignment = .center,
        @ViewBuilder content: () -> Content
    ) {
        self.backgroundColor = backgroundColor
        self.alignment = alignment
        self.content = content()
    }
}
