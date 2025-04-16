//
//  FirstAppearViewModifier.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 26.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - FirstAppearViewModifier

@available(iOS 17.0, *)
struct FirstAppearViewModifier: ViewModifier {
    private let action: () -> Void

    @State private var isViewAlreadyAppeared = false

    func body(content: Content) -> some View {
        content.onAppear {
            guard !isViewAlreadyAppeared else { return }

            action()

            isViewAlreadyAppeared = true
        }
    }

    init(action: @escaping () -> Void) {
        self.action = action
    }
}
