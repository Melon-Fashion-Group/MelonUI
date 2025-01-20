//
//  MLNTrackScrollView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 20.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNPageScrollView

///
///
///
@available(iOS 17.0, *)
public struct MLNTrackScrollView<Content: View>: View {

    // MARK: - Private properties

    private let axis: Axis
    private let anchor: UnitPoint
    @Binding private var selectedIndex: Int

    private let content: Content



    // MARK: - Body

    public var body: some View {
        switch axis {
        case .horizontal:
            HorizontalView(anchor: anchor, selection: $selectedIndex, content: content)
        case .vertical:
            VerticalView(anchor: anchor, selection: $selectedIndex, content: content)
        }
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        axis: Axis = .horizontal,
        anchor: UnitPoint = .center,
        selection: Binding<Int>,
        @ViewBuilder content: () -> Content
    ) {
        self.axis = axis
        self.anchor = anchor
        _selectedIndex = selection
        self.content = content()
    }
}
