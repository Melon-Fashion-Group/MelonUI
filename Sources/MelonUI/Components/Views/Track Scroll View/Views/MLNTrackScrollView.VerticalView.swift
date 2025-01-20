//
//  MLNTrackScrollView.VerticalView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 20.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTrackScrollView.VerticalView

@available(iOS 17.0, *)
extension MLNTrackScrollView {
    struct VerticalView: View {
        private let anchor: UnitPoint
        @Binding private var selectedIndex: Int
        private let content: Content

        @State private var currentIndex: Int?

        var body: some View {
            ScrollView(.vertical) {
                LazyVStack(spacing: .zero) {
                    content
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $currentIndex, anchor: anchor)
            .onChange(of: currentIndex) { _, newIndex in
                guard let newIndex else { return }

                selectedIndex = newIndex
            }
            .onChange(of: selectedIndex) {
                currentIndex = selectedIndex
            }
            .onAppear {
                currentIndex = selectedIndex
            }
            .animation(.smooth(duration: 0.3), value: currentIndex)
        }

        init(
            anchor: UnitPoint,
            selection: Binding<Int>,
            content: Content
        ) {
            self.anchor = anchor
            _selectedIndex = selection
            self.content = content
        }
    }
}
