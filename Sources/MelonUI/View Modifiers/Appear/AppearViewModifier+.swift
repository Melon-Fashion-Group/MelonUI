//
//  AppearViewModifier+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 25.04.2025.
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
    public func onAppear(delay: TimeInterval, perform action: @escaping () -> Void) -> some View {
        self.modifier(AppearViewModifier(delay: delay, action: action))
    }
}
