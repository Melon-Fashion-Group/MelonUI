//
//  FirstTaskViewModifier.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 26.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - FirstTaskViewModifier

@available(iOS 17.0, *)
struct FirstTaskViewModifier: ViewModifier {
    private let priority: TaskPriority
    private let action: () async -> Void

    @State private var isTaskAlreadyCompleted = false

    func body(content: Content) -> some View {
        content.task(priority: priority) {
            guard !isTaskAlreadyCompleted else { return }

            await action()

            await MainActor.run { isTaskAlreadyCompleted = true }
        }
    }

    init(
        priority: TaskPriority,
        action: @escaping () async -> Void
    ) {
        self.priority = priority
        self.action = action
    }
}
