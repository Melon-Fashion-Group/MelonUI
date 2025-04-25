//
//  ShakeGestureViewModifier.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 25.04.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - ShakeGestureViewModifier

@available(iOS 17.0, *)
struct ShakeGestureViewModifier: ViewModifier {
    private let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.onShakeGestureName)) { _ in action() }
    }

    init(action: @escaping () -> Void) {
        self.action = action
    }
}
