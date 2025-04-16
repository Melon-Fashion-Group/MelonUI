//
//  StatusBarTapDetectorView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 27.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - StatusBarTapDetectorView

@available(iOS 17.0, *)
struct StatusBarTapDetectorView: UIViewRepresentable {
    private let action: () -> Void

    init(action: @escaping () -> Void) {
        self.action = action
    }

    func makeCoordinator() -> Coordinator { .init(action: action) }

    func makeUIView(context: Context) -> UIView {
        let scrollView = UIScrollView()

        scrollView.contentOffset = .init(x: .zero, y: 10)
        scrollView.delegate = context.coordinator
        scrollView.scrollsToTop = true
        scrollView.contentSize = .init(width: 100, height: UIScreen.main.bounds.height * 2)

        return scrollView
    }

    func updateUIView(_ uiView: UIView, context: Context) { }
}
