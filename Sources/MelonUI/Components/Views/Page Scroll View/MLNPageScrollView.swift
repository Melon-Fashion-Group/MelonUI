//
//  MLNPageScrollView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 27.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNPageScrollView

///
///
///
@available(iOS 17.0, *)
public struct MLNPageScrollView<Content: View>: View {

    // MARK: - Private properties

    private let axis: Axis
    @Binding private var selectedPage: Int

    private let content: Content



    // MARK: - Body

    public var body: some View {
        switch axis {
        case .horizontal:
            HorizontalView(selection: $selectedPage, content: content)
        case .vertical:
            VerticalView(selection: $selectedPage, content: content)
        }
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        axis: Axis = .horizontal,
        selection: Binding<Int>,
        @ViewBuilder content: () -> Content
    ) {
        self.axis = axis
        _selectedPage = selection
        self.content = content()
    }
}
