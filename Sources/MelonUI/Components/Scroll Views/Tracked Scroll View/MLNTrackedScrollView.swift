//
//  MLNTrackedScrollView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 26.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTrackedScrollView

///
///
///
@available(iOS 17.0, *)
public struct MLNTrackedScrollView<ID: Hashable, Content: View>: View {

    // MARK: - Private properties

    @Binding private var scrollID: ID?
    private let axis: MLNScrollViewAxis
    private let anchor: UnitPoint
    private let content: Content



    // MARK: - Body

    public var body: some View {
        switch axis {
        case .horizontal:
            horizontalScrollView
        case .vertical:
            verticalScrollView
        }
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        id: Binding<ID?> = .constant(nil),
        axis: MLNScrollViewAxis = .horizontal,
        anchor: UnitPoint = .center,
        @ViewBuilder content: () -> Content
    ) {
        _scrollID = id
        self.axis = axis
        self.anchor = anchor
        self.content = content()
    }
}



// MARK: - UI

extension MLNTrackedScrollView {
    private var horizontalScrollView: some View {
        ScrollView(.horizontal) {
            HStack(spacing: .zero) {
                content
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrollID, anchor: anchor)
    }

    private var verticalScrollView: some View {
        ScrollView(.vertical) {
            VStack(spacing: .zero) {
                content
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrollID, anchor: anchor)
    }
}
