//
//  MLNLazyTrackedScrollView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 26.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNLazyTrackedScrollView

///
///
///
@available(iOS 17.0, *)
public struct MLNLazyTrackedScrollView<ID: Hashable, Content: View>: View {

    // MARK: - Private properties

    @Binding private var scrollID: ID?
    private let axis: MLNLazyScrollViewAxis
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
        axis: MLNLazyScrollViewAxis = .horizontal,
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

extension MLNLazyTrackedScrollView {
    private var horizontalScrollView: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: .zero) {
                content
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrollID, anchor: anchor)
    }

    private var verticalScrollView: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: .zero) {
                content
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrollID, anchor: anchor)
    }
}

