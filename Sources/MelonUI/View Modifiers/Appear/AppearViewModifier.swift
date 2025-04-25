//
//  AppearViewModifier.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 25.04.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - AppearViewModifier

@available(iOS 17.0, *)
struct AppearViewModifier: ViewModifier {
    private let delay: TimeInterval
    private let action: () -> Void

    func body(content: Content) -> some View {
        content
            .task(priority: .userInitiated) {
                let nanoseconds = convertSecondsInNanoseconds(delay)

                try? await Task.sleep(nanoseconds: nanoseconds)

                await MainActor.run { action() }
            }
    }

    init(
        delay: TimeInterval,
        action: @escaping () -> Void
    ) {
        self.delay = delay
        self.action = action
    }
}
