//
//  MLNPageTabView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 27.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNPageTabView

///
///
///
@available(iOS, introduced: 16.0, deprecated: 17.0, message: "This UI component is deprecated, use MLNPageScrollView instead")
public struct MLNPageTabView<Content: View>: View {

    // MARK: - Private properties

    private let axis: Axis
    @Binding private var selectedPage: Int

    private let content: (_ size: CGSize) -> Content

    @Environment(\.isSafeAreaIgnored) private var isSafeAreaIgnored



    // MARK: - Body

    public var body: some View {
        switch axis {
        case .horizontal:
            HorizontalView(selection: $selectedPage, content: content)
        case .vertical:
            VerticalView(selection: $selectedPage, isSafeAreaIgnored: isSafeAreaIgnored, content: content)
        }
    }



    // MARK: - Init

    public init(
        axis: Axis = .horizontal,
        selection: Binding<Int>,
        @ViewBuilder content: @escaping (_ size: CGSize) -> Content
    ) {
        self.axis = axis
        _selectedPage = selection
        self.content = content
    }
}
