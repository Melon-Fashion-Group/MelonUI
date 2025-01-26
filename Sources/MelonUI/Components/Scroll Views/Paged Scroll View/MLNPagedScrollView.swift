//
//  MLNPagedScrollView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 26.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNPagedScrollView

///
///
///
@available(iOS 17.0, *)
public struct MLNPagedScrollView<SelectionValue: Hashable, Content: View>: View {

    // MARK: - Private properties

    @Binding private var selectedValue: SelectionValue?
    private let axis: MLNScrollViewAxis
    private let content: Content



    // MARK: - Body

    public var body: some View {
        GeometryReader { geometry in
            let size = geometry.size

            switch axis {
            case .horizontal:
                horizontalScrollView(width: size.width, height: size.height)
            case .vertical:
                verticalScrollView(width: size.width, height: size.height)
            }
        }
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        selection: Binding<SelectionValue?> = .constant(nil),
        axis: MLNScrollViewAxis = .horizontal,
        @ViewBuilder content: () -> Content
    ) {
        _selectedValue = selection
        self.axis = axis
        self.content = content()
    }
}



// MARK: - UI

extension MLNPagedScrollView {
    private func horizontalScrollView(width: CGFloat, height: CGFloat) -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: .zero) {
                content
                    .frame(width: width, height: height)
            }
            .scrollTargetLayout()
        }
        .scrollBounceBehavior(.basedOnSize)
        .scrollIndicators(.never)
        .scrollPosition(id: $selectedValue)
        .scrollTargetBehavior(.paging)
    }

    private func verticalScrollView(width: CGFloat, height: CGFloat) -> some View {
        ScrollView(.vertical) {
            VStack(spacing: .zero) {
                content
                    .frame(width: width, height: height)
            }
            .scrollTargetLayout()
        }
        .scrollBounceBehavior(.basedOnSize)
        .scrollIndicators(.never)
        .scrollPosition(id: $selectedValue)
        .scrollTargetBehavior(.paging)
    }
}
