//
//  StatusBarTapGestureViewModifier.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 27.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - StatusBarTapGestureViewModifier

@available(iOS 17.0, *)
struct StatusBarTapGestureViewModifier: ViewModifier {
    private let action: () -> Void

    func body(content: Content) -> some View {
        content.overlay {
            StatusBarTapDetectorView(action: action)
                .offset(y: UIScreen.main.bounds.height)
        }
    }

    init(action: @escaping () -> Void) {
        self.action = action
    }
}
