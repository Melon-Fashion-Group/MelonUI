//
//  MLNPageIndicatorView.VerticalView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 29.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNPageIndicatorView.VerticalView

extension MLNPageIndicatorView {
    struct VerticalView: View {
        @Binding private var selectedIndicator: Int
        private let indicators: [MLNPageIndicatorView.Indicator]
        private let style: MLNPageIndicatorView.IndicatorStyle
        private let overallHeight: CGFloat

        var body: some View {
            ScrollViewReader { scrollView in
                ScrollView(.vertical) {
                    LazyVStack(spacing: style.spacing) {
                        ForEach(.zero ..< indicators.count, id: \.self) { index in
                            indicators[index].view
                                .frame(width: style.size.width, height: style.size.height)
                                .foregroundStyle(selectedIndicator == index ? style.colors.active : style.colors.inactive)
                                .id(index)
                        }
                    }
                }
                .scrollIndicators(.never)
                .scrollDisabled(true)
                .onChange(of: selectedIndicator) { _ in
                    withAnimation(style.animation) {
                        scrollView.scrollTo(selectedIndicator, anchor: .center)
                    }
                }
                .animation(style.animation, value: selectedIndicator)
            }
            .frame(width: style.size.width, height: overallHeight)
        }

        init(
            selection: Binding<Int>,
            indicators: [MLNPageIndicatorView.Indicator],
            style: MLNPageIndicatorView.IndicatorStyle
        ) {
            _selectedIndicator = selection
            self.indicators = indicators
            self.style = style
            let indicatorsHeight = style.size.height * .init(style.displayedCount)
            let spacingsHeight = style.spacing * .init(style.displayedCount - 1)
            overallHeight = indicatorsHeight + spacingsHeight
        }
    }
}
