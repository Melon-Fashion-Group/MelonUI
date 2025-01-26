//
//  FirstTaskViewModifier+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 26.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - View+

extension View {

    // MARK: - Public methods

    ///
    ///
    ///
    @available(iOS 17.0, *)
    public func onFirstTask(
        priority: TaskPriority = .userInitiated,
        action: @escaping () async -> Void
    ) -> some View {
        modifier(FirstTaskViewModifier(priority: priority, action: action))
    }
}
