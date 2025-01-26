//
//  MLNPagedIndicatorView.HorizontalView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 29.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNPagedIndicatorView.HorizontalView

extension MLNPagedIndicatorView {
    struct HorizontalView: View {
        @Binding private var selectedIndicator: Int?
        private let indicators: [MLNPagedIndicatorView.Indicator]
        private let style: MLNPagedIndicatorView.IndicatorStyle
        private let overallWidth: CGFloat

        var body: some View {
            ScrollViewReader { scrollView in
                ScrollView(.horizontal) {
                    LazyHStack(spacing: style.spacing) {
                        ForEach(indicators.indices, id: \.self) { index in
                            indicators[index].view
                                .frame(width: style.size.width, height: style.size.height)
                                .foregroundStyle(selectedIndicator == index ? style.colors.active : style.colors.inactive)
                        }
                    }
                }
                .scrollIndicators(.never)
                .scrollDisabled(true)
                .onChange(of: selectedIndicator) {
                    withAnimation(style.animation) {
                        scrollView.scrollTo(selectedIndicator, anchor: .center)
                    }
                }
                .animation(style.animation, value: selectedIndicator)
            }
            .frame(width: overallWidth, height: style.size.height)
        }

        init(
            selection: Binding<Int?>,
            indicators: [MLNPagedIndicatorView.Indicator],
            style: MLNPagedIndicatorView.IndicatorStyle
        ) {
            _selectedIndicator = selection
            self.indicators = indicators
            self.style = style
            let indicatorsWidth = style.size.width * .init(style.displayedCount)
            let spacingsWidth = style.spacing * .init(style.displayedCount - 1)
            overallWidth = indicatorsWidth + spacingsWidth
        }
    }
}
