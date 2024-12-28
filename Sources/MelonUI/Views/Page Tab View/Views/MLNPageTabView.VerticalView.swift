//
//  MLNPageTabView.VerticalView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 27.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNPageTabView.VerticalView

extension MLNPageTabView {
    struct VerticalView: View {
        @Binding private var selectedPage: Int
        private let isSafeAreaIgnored: Bool

        private let content: (_ size: CGSize) -> Content

        var body: some View {
            GeometryReader { geometry in
                let topInset = geometry.safeAreaInsets.top

                if isSafeAreaIgnored {
                    tabView(inset: topInset)
                        .ignoresSafeArea()
                } else {
                    tabView(inset: topInset)
                }
            }
        }



        // MARK: - Init

        init(
            selection: Binding<Int>,
            isSafeAreaIgnored: Bool,
            content: @escaping (_ size: CGSize) -> Content
        ) {
            _selectedPage = selection
            self.isSafeAreaIgnored = isSafeAreaIgnored
            self.content = content
        }
    }
}



// MARK: - UI

extension MLNPageTabView.VerticalView {
    @ViewBuilder
    private func tabView(inset topInset: CGFloat) -> some View {
        GeometryReader { geometry in
            let size = geometry.size

            TabView(selection: $selectedPage) {
                content(size)
                    .frame(width: size.width, height: size.height)
                    .rotationEffect(.degrees(-90))
                    .offset(y: isSafeAreaIgnored ? -topInset / 2 : .zero)
            }
            .frame(width: size.height, height: size.width)
            .rotationEffect(.degrees(90), anchor: .topLeading)
            .offset(x: size.width)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}
