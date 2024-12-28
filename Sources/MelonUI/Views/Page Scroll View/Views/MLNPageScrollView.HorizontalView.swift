//
//  MLNPageScrollView.HorizontalView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 27.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNPageScrollView.HorizontalView

@available(iOS 17.0, *)
extension MLNPageScrollView {
    struct HorizontalView: View {
        @Binding private var selectedPage: Int
        @State private var currentPage: Int? = .zero
        private let content: Content

        var body: some View {
            GeometryReader { geometry in
                let size = geometry.size

                ScrollView(.horizontal) {
                    LazyHStack(spacing: .zero) {
                        content
                            .frame(width: size.width, height: size.height)
                            .clipped()
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.paging)
                .scrollBounceBehavior(.basedOnSize)
                .scrollIndicators(.never)
                .scrollPosition(id: $currentPage)
                .onChange(of: currentPage) { _, newPage in
                    guard let newPage else { return }

                    selectedPage = newPage
                }
                .onChange(of: selectedPage) {
                    currentPage = selectedPage
                }
                .onAppear {
                    currentPage = selectedPage
                }
                .animation(.smooth(duration: 0.3), value: currentPage)
            }
        }

        init(
            selection: Binding<Int>,
            content: Content
        ) {
            _selectedPage = selection
            self.content = content
        }
    }
}
