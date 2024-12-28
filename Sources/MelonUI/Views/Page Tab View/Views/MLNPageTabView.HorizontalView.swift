//
//  MLNPageTabView.HorizontalView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 27.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNPageTabView.HorizontalView

extension MLNPageTabView {
    struct HorizontalView: View {
        @Binding private var selectedPage: Int
        private let content: (_ size: CGSize) -> Content

        var body: some View {
            GeometryReader { geometry in
                let size = geometry.size

                TabView(selection: $selectedPage) {
                    content(size)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
        }

        init(
            selection: Binding<Int>,
            content: @escaping (_: CGSize) -> Content
        ) {
            _selectedPage = selection
            self.content = content
        }
    }
}
